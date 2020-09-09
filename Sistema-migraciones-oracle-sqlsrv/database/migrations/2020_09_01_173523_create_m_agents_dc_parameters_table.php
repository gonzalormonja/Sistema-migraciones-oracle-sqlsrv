<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAgentsDcParametersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_agents_dc_parameters', function (Blueprint $table) {
            $table->integer('agent_id')->primary('PK_m_agents_dc_parameters_m_agents_dc_parameters');
            $table->integer('stgsrv_port');
            $table->string('stgsrv_ruri', 1024);
            $table->bigInteger('bkpfolder_maxsize');
            $table->string('bkpfolder_path', 1024);
            $table->integer('bkpfolder_maxfileage');
            $table->integer('bkpfolder_mode');
            $table->string('tmpFolder', 1024);
            $table->string('agent_url', 1024);
            $table->string('client_url', 1024);
            $table->integer('webservcmdint_enabled');
            $table->integer('max_days_day_billing')->nullable()->default(20);
            $table->integer('max_days_mon_billing')->nullable()->default(20);
            $table->integer('max_days_inc_profile')->nullable()->default(20);
            $table->integer('max_days_day_profile')->nullable()->default(20);
            $table->integer('max_days_mtr_events')->nullable()->default(20);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_agents_dc_parameters');
    }
}
