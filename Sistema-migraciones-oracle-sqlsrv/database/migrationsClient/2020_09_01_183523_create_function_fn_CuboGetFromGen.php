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
