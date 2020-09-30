<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMEvDescMapCncTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_ev_desc_map_cnc', function (Blueprint $table) {
            $table->increments('id_ev_cnc');
            $table->string('cnc_id', 32);
            $table->string('proto_cnc_descr', 128);
            $table->integer('app_cnc_id')->default(0);
            $table->integer('alert')->nullable();
            $table->integer('rep_ev_id');
            $table->integer('group_id');
            $table->unique(['cnc_id', 'proto_cnc_descr', 'group_id', 'rep_ev_id'], 'm_m_ev_desc_map_2_1_cnc_m_ev_desc_map_cnc');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_ev_desc_map_cnc');
    }
}
