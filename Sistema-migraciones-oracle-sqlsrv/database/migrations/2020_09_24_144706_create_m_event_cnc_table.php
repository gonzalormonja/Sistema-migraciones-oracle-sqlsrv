<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMEventCncTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_event_cnc', function (Blueprint $table) {
            $table->increments('m_event_cnc_id');
            $table->string('cnc_id', 32);
            $table->integer('event_cnc_id');
            $table->dateTime('cnc_t');
            $table->dateTime('local_t');
            $table->integer('ms');
            $table->string('add_data', 1024)->nullable();
            $table->string('add_data2', 1024)->nullable();
            $table->integer('report');
            $table->unique(['cnc_id', 'event_cnc_id', 'cnc_t', 'add_data'], 'IX_m_event_cnc_m_event_cnc');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_event_cnc');
    }
}
