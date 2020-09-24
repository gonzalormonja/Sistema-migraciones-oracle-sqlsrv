<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMActiveTasksResTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_active_tasks_res', function (Blueprint $table) {
            $table->increments('task_id');
            $table->integer('task');
            $table->string('req_id', 3);
            $table->string('cnc_id', 32);
            $table->string('req_param', 2048);
            $table->integer('priority');
            $table->integer('max_retries');
            $table->integer('t_retry');
            $table->integer('max_time')->nullable();
            $table->integer('resp_mode');
            $table->integer('group_id');
            $table->dateTime('initial_time')->nullable();
            $table->integer('state');
            $table->integer('n_retry');
            $table->dateTime('stime')->nullable();
            $table->integer('agent_id');
            $table->integer('port_id')->nullable();
            $table->integer('int_port')->nullable();
            $table->integer('error_code');
            $table->string('parcial_error', 256);
            $table->integer('schedule');
            $table->integer('user_id')->nullable();
            $table->string('user_name', 45)->nullable();
            $table->integer('task_per')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_active_tasks_res');
    }
}
