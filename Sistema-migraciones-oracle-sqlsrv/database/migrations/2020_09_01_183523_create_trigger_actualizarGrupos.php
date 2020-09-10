<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTriggerActualizarGrupos extends Migration
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
            $sql="CREATE TRIGGER [dbo].[ActualizarGrupos] ON m_app_pa_data
                    AFTER INSERT
                    AS 
                    BEGIN
                        SET NOCOUNT ON;
                        -- interfering with SELECT statements.
                        SET XACT_ABORT OFF;
                        update m_location set group_id=T1.group_id
                        FROM  m_cnc T1  
                        INNER JOIN m_app_pa_data T2 ON  T1.cnc_id = T2.cnc_id  
                        INNER JOIN m_location T3  ON T2.meter_id=T3.meter_id
                        WHERE  T3.group_id <> T1.group_id
                    END ;";
            DB::unprepared($sql);
            $sql = "ALTER TABLE [dbo].[m_app_pa_data] ENABLE TRIGGER [ActualizarGrupos];";
            DB::unprepared($sql);
        }else{

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
