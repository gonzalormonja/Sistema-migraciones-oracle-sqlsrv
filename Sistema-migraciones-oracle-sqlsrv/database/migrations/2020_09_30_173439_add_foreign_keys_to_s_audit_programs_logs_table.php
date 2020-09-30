<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToSAuditProgramsLogsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('s_audit_programs_logs', function (Blueprint $table) {
            $table->foreign(array('log_id'), 'FK_S_AUDIT_PROGRAMS_LOGS_LOG')->references(array('id'))->on('s_audit_log')->onUpdate('NO ACTION')->onDelete('CASCADE');
            $table->foreign(array('program_id'), 'FK_S_AUDIT_PROGRAMS_LOGS_PROGRAM')->references(array('id'))->on('s_audit_programs')->onUpdate('NO ACTION')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('s_audit_programs_logs', function (Blueprint $table) {
            $table->dropForeign('FK_S_AUDIT_PROGRAMS_LOGS_LOG');
            $table->dropForeign('FK_S_AUDIT_PROGRAMS_LOGS_PROGRAM');
        });
    }
}
