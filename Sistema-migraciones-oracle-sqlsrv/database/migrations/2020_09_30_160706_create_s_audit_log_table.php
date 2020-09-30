<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSAuditLogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('s_audit_log', function (Blueprint $table) {
            $table->increments('id');
            $table->string('module', 50)->index('IX_S_AUDIT_MODULE_s_audit_log');
            $table->string('action', 50)->index('IX_S_AUDIT_ACTION_s_audit_log');
            $table->integer('client_id')->nullable()->index('IX_S_AUDIT_CLIENT_s_audit_log');
            $table->dateTime('date_time')->useCurrent()->index('IX_S_AUDIT_DATE_TIME_s_audit_log');
            $table->string('id_object', 120)->nullable()->index('IX_S_AUDIT_ID_OBJECT_s_audit_log');
            $table->string('id_object_relation', 120)->nullable();
            $table->integer('user_id')->nullable()->index('IX_S_AUDIT_USERID_s_audit_log');
            $table->string('user_name', 50)->nullable();
            $table->string('user_ip', 15)->nullable();
            $table->string('log_comment', 50)->nullable();
            $table->string('name_object', 200)->nullable()->index('IX_S_AUDIT_NAME_OBJECT_s_audit_log');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('s_audit_log');
    }
}
