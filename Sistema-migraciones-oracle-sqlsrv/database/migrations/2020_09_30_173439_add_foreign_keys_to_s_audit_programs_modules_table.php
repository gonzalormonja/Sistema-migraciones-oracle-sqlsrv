<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToSAuditProgramsModulesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('s_audit_programs_modules', function (Blueprint $table) {
            $table->foreign(array('program_id'), 'FK_S_AUDIT_PROGRAMS_PROGRAM_ID')->references(array('id'))->on('s_audit_programs')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('module_id'), 'FK_S_AUDIT_PROGRAMS_MODULE_ID')->references(array('id'))->on('s_audit_modules')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('s_audit_programs_modules', function (Blueprint $table) {
            $table->dropForeign('FK_S_AUDIT_PROGRAMS_PROGRAM_ID');
            $table->dropForeign('FK_S_AUDIT_PROGRAMS_MODULE_ID');
        });
    }
}
