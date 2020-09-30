<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMConfigTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_config_tasks', function (Blueprint $table) {
            $table->increments('task_id');
            $table->string('meter_id', 32);
            $table->string('command', 512);
            $table->dateTime('start_time');
            $table->dateTime('end_time');
            $table->string('period', 50)->nullable();
            $table->integer('priority');
            $table->integer('max_retries');
            $table->integer('t_retry');
            $table->integer('max_time')->nullable();
            $table->integer('enable')->default(1);
            $table->integer('do_now')->default(0);
            $table->integer('include_slaves');
            $table->integer('task_do')->nullable();
            $table->dateTime('next_execution')->nullable();
            $table->integer('do_always')->nullable();
            $table->integer('task_act')->nullable()->default(-1);
            $table->integer('trace_call')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_config_tasks');
    }
}
