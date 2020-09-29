<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMConfigTasksResTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_config_tasks_res', function (Blueprint $table) {
            $table->increments('task_id');
            $table->string('req_id', 3);
            $table->string('cnc_id', 32);
            $table->string('req_param', 2048);
            $table->dateTime('start_time');
            $table->dateTime('end_time');
            $table->integer('period');
            $table->integer('priority');
            $table->integer('max_retries');
            $table->integer('t_retry');
            $table->integer('max_time')->nullable();
            $table->integer('resp_mode');
            $table->integer('enable')->default(1);
            $table->integer('do_now')->default(0);
            $table->integer('user_id')->nullable();
            $table->string('user_name', 45)->nullable();
            $table->integer('task_per')->nullable();
            $table->integer('do_always')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_config_tasks_res');
    }
}
