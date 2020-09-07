<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAgentsDcAdvParametersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_agents_dc_adv_parameters', function (Blueprint $table) {
            $table->integer('agent_id')->primary('PK_m_agents_dc_advanced_parameters_m_agents_dc_adv_parameters');
            $table->integer('ncmdq_size');
            $table->integer('rcmdq_size');
            $table->integer('ndataq_size');
            $table->integer('cmddefault_period');
            $table->integer('cmdprocess_period');
            $table->integer('ftpprocess_period');
            $table->integer('ftpprocess_maxsize');
            $table->integer('ftpprocess_maxfilecount');
            $table->integer('tmpprocess_period');
            $table->integer('tmpprocess_maxsize');
            $table->integer('tmpprocess_maxfilecount');
            $table->integer('timer_resolution');
            $table->integer('timer_period');
            $table->integer('twait_start');
            $table->integer('twait_stop');
            $table->integer('maxcncconn');
            $table->integer('maxcncsimreq');
            $table->integer('trc_appint');
            $table->integer('trc_monint');
            $table->integer('trc_agent');
            $table->integer('trc_dcagent_1');
            $table->integer('trc_dcagent_2');
            $table->integer('dbtasknew_period');
            $table->integer('dbtaskact_period');
            $table->integer('dbtask_maxsimreq');
            $table->integer('cmdage_multi');
            $table->integer('dbtask_dateoffset');
            $table->integer('bcp_rowsperbatch');
            $table->string('bcp_datafile', 1024)->nullable();
            $table->string('bcp_fmtfolderpath', 1024)->nullable();
            $table->string('bcp_m_profile_date_file', 1024)->nullable();
            $table->integer('dbtasksch_period')->nullable()->default(20);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_agents_dc_adv_parameters');
    }
}
