<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCTzTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_tz', function (Blueprint $table) {
            $table->increments('tz_id');
            $table->integer('tz')->nullable();
            $table->string('tz_desc', 50)->nullable();
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
            $sql = "DBCC checkident ('c_tz', reseed, 0);";
            DB::unprepared($sql);
        }else{
            $name = "C_TZ_"."TZ_ID";
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
        Schema::dropIfExists('c_tz');
    }
}
