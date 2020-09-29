<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMUnitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_units', function (Blueprint $table) {
            $table->increments('id');
            $table->string('descr', 16);
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
            $sql = "DBCC checkident ('m_units', reseed, 0);";
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
        Schema::dropIfExists('m_units');
    }
}
