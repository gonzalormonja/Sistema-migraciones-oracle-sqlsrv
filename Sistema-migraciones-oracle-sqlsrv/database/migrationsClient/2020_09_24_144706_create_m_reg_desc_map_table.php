<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMRegDescMapTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_reg_desc_map', function (Blueprint $table) {
            $table->increments('id');
            $table->string('meter_id', 32);
            $table->string('proto_descr', 128);
            $table->integer('app_id');
            $table->integer('reg_type')->nullable();
            $table->integer('aTV')->default(0);
            $table->integer('aTI')->default(0);
            $table->integer('aTU')->default(0);
            $table->integer('aTP')->default(0);
            $table->float('Ke', 53, 0)->default(1);
            $table->integer('id_unit')->default(0);
            $table->integer('id_raw_unit');
            $table->integer('channel')->default(0);
            $table->integer('log')->default(0);
            $table->unique(['meter_id', 'proto_descr', 'reg_type', 'log'], 'm_reg_desc_map_2_1_m_reg_desc_map');
            $table->index(['proto_descr', 'app_id', 'reg_type', 'aTV', 'aTI', 'aTU', 'aTP', 'Ke', 'id_unit', 'id_raw_unit', 'meter_id'], 'idx_m_reg_desc_map_canales_grid_m_reg_desc_map');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_reg_desc_map');
    }
}
