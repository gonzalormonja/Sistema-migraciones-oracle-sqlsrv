<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMSchedulersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_schedulers', function (Blueprint $table) {
            $table->integer('sched_id')->primary('PK_m_schedulers_m_schedulers');
            $table->string('sched_name', 32);
            $table->string('descr', 80)->nullable();
            $table->string('ip_addr', 16);
            $table->integer('port');
            $table->integer('enable');
            $table->integer('T_ka_rx');
            $table->integer('T1');
            $table->integer('T2');
            $table->integer('T3');
            $table->integer('T4');
            $table->integer('log_level');
            $table->integer('ip_log_level');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_schedulers');
    }
}
