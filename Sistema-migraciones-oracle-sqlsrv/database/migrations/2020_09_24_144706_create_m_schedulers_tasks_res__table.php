<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMSchedulersTasksResTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_schedulers_tasks_res ', function (Blueprint $table) {
            $table->increments('task_id');
            $table->integer('task ');
            $table->dateTime('next_execution');
            $table->dateTime('start_time')->nullable();
            $table->dateTime('end_time')->nullable();
            $table->string('period', 50);
            $table->string('req_id', 3);
            $table->string('cnc_id', 32);
            $table->string('req_param', 2048);
            $table->integer('priority');
            $table->integer('max_time')->nullable();
            $table->integer('resp_mode');
            $table->integer('enable')->nullable();
            $table->integer('user_id');
            $table->string('user_name', 45)->nullable();
            $table->integer('do_always')->nullable();
            $table->integer('task_do')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_schedulers_tasks_res ');
    }
}
