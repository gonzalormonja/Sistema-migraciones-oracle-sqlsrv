<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMEvDescMapTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_ev_desc_map', function (Blueprint $table) {
            $table->increments('id');
            $table->string('meter_id', 32);
            $table->string('proto_descr', 128);
            $table->integer('app_id')->default(0);
            $table->integer('alert')->nullable();
            $table->integer('rep_ev_id')->default(-1);
            $table->integer('group_id')->default(-1);
            $table->unique(['meter_id', 'proto_descr', 'group_id', 'rep_ev_id'], 'm_m_ev_desc_map_2_1_m_ev_desc_map');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_ev_desc_map');
    }
}
