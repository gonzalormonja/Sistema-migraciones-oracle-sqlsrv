<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCCityTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_city', function (Blueprint $table) {
            $table->increments('id');
            $table->string('city', 60);
            $table->string('cp', 30);
            $table->string('state', 50);
            $table->string('country', 50);
        });
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
            $sql = "DBCC checkident ('c_city', reseed, 0);";
            DB::unprepared($sql);
        }else{
            $name = "C_CITY_"."ID";
            $sql = "SELECT SEQUENCE_NAME FROM all_sequences WHERE SEQUENCE_NAME LIKE '".$name."%'";
            $resp = DB::select($sql)[0]->sequence_name;
            $sql = "ALTER SEQUENCE ".$resp." MINVALUE 0";
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
        Schema::dropIfExists('c_city');
    }
}
