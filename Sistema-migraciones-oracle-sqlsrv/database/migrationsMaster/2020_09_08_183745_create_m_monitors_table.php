<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMMonitorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_monitors', function (Blueprint $table) {
            $table->increments('id');
            $table->string('mon_ip_addr', 16)->unique('UK_m_monitors_m_monitors');
            $table->integer('mon_port');
            $table->integer('cl_port');
            $table->integer('T1');
            $table->integer('T2');
            $table->integer('T3');
            $table->integer('ka_time');
            $table->integer('log_level');
            $table->integer('udp_log_level');
            $table->integer('tcp_log_level');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_monitors');
    }
}
