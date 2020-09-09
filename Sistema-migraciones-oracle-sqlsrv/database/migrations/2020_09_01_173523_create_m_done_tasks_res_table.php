<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMDoneTasksResTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_done_tasks_res', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('task_id');
            $table->integer('schedule');
            $table->string('req_id', 3);
            $table->string('cnc_id', 32);
            $table->string('resp_id', 3);
            $table->integer('resp_type');
            $table->string('req_resp', 2048);
            $table->dateTime('initial_time');
            $table->integer('retries');
            $table->dateTime('end_time');
            $table->string('agent_id', 32)->nullable();
            $table->integer('port_id')->nullable();
            $table->integer('error_code');
            $table->string('parcial_error', 256);
            $table->integer('task_ack');
            $table->dateTime('ack_date')->nullable();
            $table->integer('user_id')->nullable();
            $table->string('user_name', 45)->nullable();
            $table->integer('task_per')->nullable()->default(-1);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_done_tasks_res');
    }
}
