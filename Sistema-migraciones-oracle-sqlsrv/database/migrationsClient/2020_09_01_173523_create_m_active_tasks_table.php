<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMActiveTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_active_tasks', function (Blueprint $table) {
            $table->increments('task_id');
            $table->integer('task');
            $table->string('meter_id', 32);
            $table->string('command', 512);
            $table->integer('priority');
            $table->integer('max_retries');
            $table->integer('t_retry');
            $table->integer('max_time')->nullable();
            $table->integer('group_id');
            $table->dateTime('initial_time')->nullable();
            $table->integer('state');
            $table->integer('n_retry');
            $table->dateTime('stime');
            $table->integer('agent_id');
            $table->integer('port_id')->nullable();
            $table->integer('int_port')->nullable();
            $table->integer('error_code');
            $table->integer('schedule');
            $table->integer('include_slaves');
            $table->integer('trace_call')->default(0);
            $table->integer('do_now')->default(0);
            $table->integer('port_id_last')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_active_tasks');
    }
}
