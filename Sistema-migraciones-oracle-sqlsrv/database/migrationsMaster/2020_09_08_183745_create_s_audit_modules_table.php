<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSAuditModulesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('s_audit_modules', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 50)->nullable()->unique('UQ_S_AUDIT_MODULES_NAME_s_audit_modules');
            $table->string('module_type', 15);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('s_audit_modules');
    }
}
