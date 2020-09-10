<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMEventTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_event', function (Blueprint $table) {
            $table->increments('m_event_id');
            $table->string('meter_id', 32);
            $table->integer('event_id');
            $table->dateTime('meter_t');
            $table->dateTime('local_t');
            $table->integer('ms');
            $table->string('add_data', 1024)->nullable();
            $table->string('add_data2', 1024)->nullable();
            $table->integer('report')->default(-1);
            $table->string('cnc_id', 32)->default('-1');
            $table->dateTime('datetime_pc')->useCurrent();
            $table->unique(['meter_id', 'event_id', 'meter_t', 'add_data'], 'IX_m_event_m_event');
            $table->index(['meter_id', 'meter_t', 'local_t', 'ms', 'report', 'cnc_id', 'datetime_pc'], 'IX_m_event_datetime_pc_m_event');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_event');
    }
}
