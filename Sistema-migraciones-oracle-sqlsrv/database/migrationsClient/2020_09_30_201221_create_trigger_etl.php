<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTriggerEtl extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $file = ".env";
        $isSqlServer=true;
        $fp = fopen($file,"r+") or die("ocurrio un error");
        while ($linea = fgets($fp)) {
            $cadena_buscada = "oracle";
            $pos = strpos($linea,$cadena_buscada);
            if($pos!==false){
                $isSqlServer=false;
            }
        }
        if($isSqlServer){
            $sql="CREATE TRIGGER [dbo].[ETL]
                            ON [dbo].[m_meters]
                            AFTER UPDATE
                            AS
                            SET XACT_ABORT OFF
                            BEGIN
                            IF UPDATE (prof_last_read)   
                                BEGIN
                                INSERT INTO P_ETL
                                (datetime_up, execute_etl, PROF_LAST_READ_OLD, PROF_LAST_READ_NEW, EOB_LAST_READ_OLD, EOB_LAST_READ_NEW, meter_id)
                                SELECT getdate(), 1, b. prof_last_read, a.prof_last_read, b.eob_last_read, a.eob_last_read, a.meter_id
                                from inserted a join deleted b on a.meter_id=b.meter_id
                            END
                    END;";
            DB::unprepared($sql);
            $sql = "ALTER TABLE [dbo].[m_meters] ENABLE TRIGGER [ETL];";
            DB::unprepared($sql);
        }else{
            $sql="
            CREATE OR REPLACE EDITIONABLE TRIGGER ETL AFTER UPDATE ON m_meters
            FOR EACH ROW
            BEGIN
                IF UPDATING('prof_last_read')
                    THEN
                    INSERT INTO P_ETL
                    (datetime_up, execute_etl, PROF_LAST_READ_OLD, PROF_LAST_READ_NEW, EOB_LAST_READ_OLD, EOB_LAST_READ_NEW, meter_id)
                    SELECT CURRENT_DATE, 1, :OLD.prof_last_read, :NEW.prof_last_read, :OLD.eob_last_read, :NEW.eob_last_read, :NEW.meter_id
                    from dual where :NEW.meter_id=:OLD.meter_id;
                    END IF;
            END;
            ";
            DB::unprepared($sql);
            $sql = 
            "
            ALTER TRIGGER ETL ENABLE
            ";
            DB::unprepared($sql);
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_link_abb_data');
    }
}
