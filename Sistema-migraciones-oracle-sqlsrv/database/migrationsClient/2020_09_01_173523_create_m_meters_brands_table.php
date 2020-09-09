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
