<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMEventGroupCncTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_event_group_cnc', function (Blueprint $table) {
            $table->integer('id_ev_gp_cnc')->primary('PK__m_event___4E05DA310FC619E8_m_event_group_cnc');
            $table->string('name_ev_gp_cnc', 100)->nullable();
            $table->string('descr_ev_gp_cnc', 250)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_event_group_cnc');
    }
}
