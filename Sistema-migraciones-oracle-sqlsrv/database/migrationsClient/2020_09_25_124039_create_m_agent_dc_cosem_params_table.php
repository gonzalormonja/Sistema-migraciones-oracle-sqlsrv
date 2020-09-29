<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAgentDcCosemParamsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_agent_dc_cosem_params', function (Blueprint $table) {
            $table->string('device_id', 32);
            $table->integer('acse_proto_version');
            $table->integer('acse_context_name');
            $table->integer('acse_auth_choice');
            $table->string('acse_auth_value', 64);
            $table->integer('acse_mechanism_name');
            $table->integer('dlms_version');
            $table->integer('dlms_max_recv_pdu_size');
            $table->integer('dlms_conformance');
            $table->integer('dlms_conformance_legacy_tag');
            $table->string('dlms_key_value', 64);
            $table->integer('log_level');
            $table->char('acse_key_authentication', 16)->nullable();
            $table->char('acse_key_encryption', 16)->nullable();
            $table->char('acse_system_title', 8)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_agent_dc_cosem_params');
    }
}
