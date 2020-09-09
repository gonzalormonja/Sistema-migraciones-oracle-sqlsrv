<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToSAuditDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('s_audit_details', function (Blueprint $table) {
            $table->foreign(array('audit_log_id'), 'FK__s_audit_d__audit__18EBB532')->references(array('id'))->on('s_audit_log')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('s_audit_details', function (Blueprint $table) {
            $table->dropForeign('FK__s_audit_d__audit__18EBB532');
        });
    }
}
