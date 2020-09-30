<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateURolTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('u_rol', function (Blueprint $table) {
            $table->string('rol_name', 16);
            $table->string('rol_desc', 128)->nullable();
            $table->integer('rol_enable');
            $table->integer('client_id');
            $table->increments('rol_id');
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
            $sql = "DBCC checkident ('u_rol', reseed, 0);";
            DB::unprepared($sql);
        }else{
            $name = "U_ROL_"."ROL_ID_";
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
        Schema::dropIfExists('u_rol');
    }
}
