<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSAuditDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('s_audit_details', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('audit_log_id')->nullable();
            $table->string('log_type', 10)->nullable()->index('IX_S_AUDIT_LOG_TYPE_s_audit_details');
            $table->text('content')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('s_audit_details');
    }
}
