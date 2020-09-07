<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMCallHistoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_call_history', function (Blueprint $table) {
            $table->integer('task_id');
            $table->integer('port_id');
            $table->dateTime('initial_time');
            $table->string('meter_id', 32);
            $table->integer('stage_id');
            $table->string('stage_status', 11);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_call_history');
    }
}
