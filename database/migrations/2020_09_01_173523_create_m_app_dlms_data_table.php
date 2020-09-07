<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAppDlmsDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_app_dlms_data', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('PK_m_app_dlms_data_m_app_dlms_data');
            $table->integer('acse_proto_version')->default(1);
            $table->integer('acse_context_name')->nullable();
            $table->integer('acse_auth_choice')->default(0);
            $table->string('acse_auth_value', 104)->nullable();
            $table->integer('acse_mechanism_name')->default(1);
            $table->integer('dlms_version')->default(6);
            $table->integer('dlms_max_recv_pdu_size')->default(0);
            $table->integer('dlms_conformance');
            $table->integer('dlms_conformance_legacy_tag')->default(0);
            $table->string('dlms_key_value', 32)->nullable();
            $table->integer('dlms_use_rlrq');
            $table->integer('log_level')->default(0);
            $table->char('acse_system_title', 8)->nullable();
            $table->string('acse_key_authentication', 104)->nullable();
            $table->string('acse_key_encryption', 104)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_app_dlms_data');
    }
}
