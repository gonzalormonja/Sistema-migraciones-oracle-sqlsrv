<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFunctionFnCuboGetLastExecute extends Migration
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
            $sql="CREATE FUNCTION dbo.fn_CubeGetLastExecute (@main_filter varchar(30)) RETURNS datetime AS
            BEGIN
                DECLARE @from datetime
            
                SET @from = (SELECT max(startd) FROM d_cube_status WHERE main_filter = @main_filter)
                
                RETURN @from
            
            END";
            DB::unprepared($sql);
        }else{
            $sql = "
            CREATE OR REPLACE FUNCTION fn_CubeGetLastExecute (p_main_filter varchar2)
                RETURN date 
            IS
                v_ResultVar date;
            BEGIN
                SELECT max(startd) into v_ResultVar FROM d_cube_status WHERE main_filter = p_main_filter;
                
                IF v_ResultVar IS NOT NULL THEN
                    RETURN (v_ResultVar);
                ELSE
                    RETURN (SYSDATE - 120);
                END IF;
            END;
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
