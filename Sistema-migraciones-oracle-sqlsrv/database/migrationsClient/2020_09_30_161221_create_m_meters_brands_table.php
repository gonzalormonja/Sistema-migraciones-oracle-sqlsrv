<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMMetersBrandsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_meters_brands', function (Blueprint $table) {
            $table->increments('brand_id');
            $table->string('brand', 32);
            $table->string('model', 32);
            $table->string('version', 32)->nullable();
            $table->integer('def_app_proto')->nullable();
            $table->integer('def_phy_proto')->nullable();
            $table->unique(['brand_id', 'model', 'version'], 'IX_m_brands_m_meters_brands');
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
            $sql = "DBCC checkident ('m_meters_brands', reseed, 0);";
            DB::unprepared($sql);
        }else{
            $name = "M_METERS_BRANDS_"."BRAND_ID";
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
        Schema::dropIfExists('m_meters_brands');
    }
}
