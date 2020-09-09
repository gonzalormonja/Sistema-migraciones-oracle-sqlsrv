<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAuxDoneTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_aux_done_tasks', function (Blueprint $table) {
            $table->integer('task_id');
            $table->string('meter_id', 32);
            $table->dateTime('ti')->nullable();
            $table->dateTime('tf')->nullable();
            $table->integer('nr');
            $table->integer('result');
            $table->dateTime('s_lt')->nullable();
            $table->integer('s_dst')->nullable();
            $table->integer('s_tz ')->nullable();
            $table->dateTime('m_lt')->nullable();
            $table->integer('m_dst_read')->nullable();
            $table->integer('m_dst')->nullable();
            $table->string('m_dst_src', 10)->nullable();
            $table->integer('m_tz_read')->nullable();
            $table->integer('m_tz')->nullable();
            $table->integer('tinfo_stored')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_aux_done_tasks');
    }
}
