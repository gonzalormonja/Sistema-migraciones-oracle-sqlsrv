<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFunctionFnCuboGetFromGen extends Migration
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
            $sql="CREATE FUNCTION fn_CubeGetFromGen (@main_filter varchar(30)) RETURNS varchar(8) AS
                    BEGIN
                        DECLARE @from datetime, @ResultVar varchar(8)
                    
                        SET @from = (SELECT
                            CASE max_from_gen
                                WHEN '1M' THEN DATEADD(month, -1, GETDATE())
                                WHEN '3M' THEN DATEADD(month, -3, GETDATE())
                                WHEN '6M' THEN DATEADD(month, -6, GETDATE())
                                WHEN '1Y' THEN DATEADD(year, -1, GETDATE())
                                WHEN '2Y' THEN DATEADD(year, -2, GETDATE())
                                WHEN '3Y' THEN DATEADD(year, -3, GETDATE())
                                ELSE DATEADD(year, -5, GETDATE())
                            END as fr
                        FROM
                            d_cube_config
                        WHERE
                            main_filter = @main_filter)
                    
                        RETURN CAST(YEAR(@from) as varchar) + RIGHT('0' + CAST(MONTH(@from) as varchar), 2) + RIGHT('0' + CAST(DAY(@from) as varchar), 2)
                    
                    END";
            DB::unprepared($sql);
        }else{
            $sql = "
            create or replace NONEDITIONABLE FUNCTION fn_CubeGetFromGen (p_main_filter varchar2)
                RETURN varchar2 
            IS
                v_ResultVar varchar2(8);
            BEGIN

            SELECT CASE MAX_FROM_GEN
                WHEN '1M' THEN TO_CHAR(ADD_MONTHS(SYSTIMESTAMP, -1), 'YYYYMMDD')
                WHEN '3M' THEN TO_CHAR(ADD_MONTHS(SYSTIMESTAMP, -3), 'YYYYMMDD')
                WHEN '6M' THEN TO_CHAR(ADD_MONTHS(SYSTIMESTAMP, -6), 'YYYYMMDD')
                WHEN '1Y' THEN TO_CHAR(ADD_MONTHS(SYSTIMESTAMP, -12), 'YYYYMMDD')
                WHEN '2Y' THEN TO_CHAR(ADD_MONTHS(SYSTIMESTAMP, -24), 'YYYYMMDD')
                WHEN '3Y' THEN TO_CHAR(ADD_MONTHS(SYSTIMESTAMP, -36), 'YYYYMMDD')
                ELSE TO_CHAR(ADD_MONTHS(SYSTIMESTAMP, -50), 'YYYYMMDD')
                END INTO v_ResultVar
                FROM d_cube_config WHERE main_filter = p_main_filter;

                RETURN (v_ResultVar);
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
