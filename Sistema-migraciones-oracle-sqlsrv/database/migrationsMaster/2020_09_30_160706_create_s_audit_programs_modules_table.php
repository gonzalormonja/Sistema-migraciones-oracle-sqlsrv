<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSAuditProgramsModulesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('s_audit_programs_modules', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('program_id');
            $table->integer('module_id')->index('IX_S_AUDIT_PROGRAMS_MODULES_s_audit_programs_modules');
            $table->date('date_since')->nullable();
            $table->date('date_until')->nullable();
            $table->unique(['program_id', 'module_id'], 'UQ_S_AUDIT_PROGRAMS_MODULES_PROGRAM_MODULE_s_audit_programs_modules');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('s_audit_programs_modules');
    }
}
