<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAgentDcDlmsipParamsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_agent_dc_dlmsip_params', function (Blueprint $table) {
            $table->string('device_id', 32);
            $table->integer('ph_conn_tout');
            $table->integer('tr');
            $table->integer('retries');
            $table->integer('version');
            $table->integer('src');
            $table->integer('dst');
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
        Schema::dropIfExists('m_agent_dc_dlmsip_params');
    }
}
