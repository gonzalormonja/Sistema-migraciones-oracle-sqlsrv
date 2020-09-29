<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToSAuditLogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('s_audit_log', function (Blueprint $table) {
            $table->foreign(array('client_id'), 'FK__s_audit_l__clien__151B244E')->references(array('client_id'))->on('c_clients')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('user_id'), 'FK__s_audit_l__user___160F4887')->references(array('user_id'))->on('u_users')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('s_audit_log', function (Blueprint $table) {
            $table->dropForeign('FK__s_audit_l__clien__151B244E');
            $table->dropForeign('FK__s_audit_l__user___160F4887');
        });
    }
}
