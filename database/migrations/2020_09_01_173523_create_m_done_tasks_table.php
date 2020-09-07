<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMDoneTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_done_tasks', function (Blueprint $table) {
            $table->integer('id');
            $table->integer('task_id');
            $table->integer('schedule');
            $table->string('meter_id', 32);
            $table->string('command', 512);
            $table->dateTime('initial_time');
            $table->integer('retries');
            $table->dateTime('end_time');
            $table->string('agent_id', 32)->nullable();
            $table->integer('port_id')->nullable();
            $table->integer('error_code');
            $table->dateTime('s_lt')->nullable();
            $table->integer('s_dst')->nullable();
            $table->integer('s_tz')->nullable();
            $table->dateTime('m_lt')->nullable();
            $table->integer('m_dst')->nullable();
            $table->string('m_dst_src', 10)->nullable();
            $table->integer('m_tz')->nullable();
            $table->integer('trace_call')->default(0);
            $table->integer('do_now')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_done_tasks');
    }
}
