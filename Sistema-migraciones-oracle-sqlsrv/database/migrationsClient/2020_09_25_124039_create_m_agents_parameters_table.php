<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAgentsParametersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_agents_parameters', function (Blueprint $table) {
            $table->integer('agent_id')->primary('PK_m_agents_parameters_m_agents_parameters');
            $table->integer('port');
            $table->integer('sched_id');
            $table->integer('share_id');
            $table->integer('T3');
            $table->integer('wkr_T_poll');
            $table->integer('wkr_T_ka');
            $table->integer('sched_T_conn');
            $table->integer('sched_T_ka');
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
        Schema::dropIfExists('m_agents_parameters');
    }
}
