<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTriggerPuntoDeMedida extends Migration
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
            $sql="CREATE TRIGGER [dbo].[PuntoDeMedida] ON [dbo].[m_meters] AFTER INSERT AS
                    DECLARE @medidor varchar(32)
                    DECLARE @id varchar(45)
                    
                        SELECT @medidor=meter_id FROM inserted
                    
                        DECLARE @app_proto int
                        SELECT @app_proto=app_proto_id FROM inserted
                        SET XACT_ABORT OFF
                        BEGIN
                            IF (@app_proto=(select proto_id from m_app_protos where descr='PRIME ALLIANCE')) BEGIN
                    
                                SELECT @id=CONVERT(VARCHAR(max), CRYPT_GEN_RANDOM(22),2)
                                WHILE 0 != (SELECT count(id_meter_point) from [dbo].[m_location] where id_meter_point=@id) BEGIN
                                        SELECT @id = CONVERT(VARCHAR(max), CRYPT_GEN_RANDOM(22),2)
                            END
                            
                            INSERT INTO m_location (id_meter_point, address1, address2, address3, latitude, longitude, group_id, customer_id, meter_id, active_date, description, id_city, comments, TV, TI, virtual, name_meter_point) Values (@id, ' ', null, null, null, null, 1, 1, @medidor, getdate()-60, '', 0, '', 1, 1, 0, CONCAT('P_',@medidor))
                    
                            INSERT INTO m_location_meters(id_meter_point, meter_id, active_date, deactiv_date) values(@id, @medidor, getdate()-60, null)
                        END
                    
                    END";
            DB::unprepared($sql);
            $sql="ALTER TABLE [dbo].[m_meters] ENABLE TRIGGER [PuntoDeMedida]";
            DB::unprepared($sql);
        }else{
            $sql=
            "
            CREATE OR REPLACE TRIGGER PuntoDeMedida AFTER INSERT ON m_meters
            FOR EACH ROW
            DECLARE
            medidor varchar2(32);
            app_proto_id number;
            app_proto_comp number;
            BEGIN
            SELECT :NEW.meter_id INTO medidor FROM dual;
            SELECT :NEW.app_proto_id INTO app_proto_id FROM dual;
            select proto_id INTO app_proto_comp from m_app_protos where descr='PRIME ALLIANCE';
            IF app_proto_id = app_proto_comp
            THEN
            INSERT INTO m_location (id_meter_point, address1, address2, address3, latitude, longitude, group_id, customer_id, meter_id, active_date,description, id_city, comments, TV, TI)   values(CONCAT('P_',medidor),' ',null,null,null,null,1,1,medidor,CURRENT_DATE-60,'',0,'',1,1);
            INSERT INTO m_location_meters (id_meter_point, meter_id, active_date, deactiv_date)  values(CONCAT('P_',medidor),medidor,CURRENT_DATE-60,null);
            END IF;
            END;
            ";
            
            DB::unprepared($sql);
            $sql="ALTER TRIGGER PuntoDeMedida ENABLE";
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
