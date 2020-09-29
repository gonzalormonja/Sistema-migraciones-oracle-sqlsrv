<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAgControllersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_ag_controllers', function (Blueprint $table) {
            $table->increments('id');
            $table->string('ip_addr', 16)->unique('UK_m_ag_controllers_m_ag_controllers');
            $table->string('monitor_ip', 16);
            $table->integer('monitor_port');
            $table->integer('cmd_port');
            $table->string('log_ip', 16);
            $table->integer('log_port');
            $table->integer('log_level');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_ag_controllers');
    }
}
