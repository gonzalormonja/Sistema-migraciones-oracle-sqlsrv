<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMCallHistoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_call_history', function (Blueprint $table) {
            $table->foreign(array('stage_id'), 'FK_m_call_history_m_call_stages')->references(array('stage_id'))->on('m_call_stages')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_call_history', function (Blueprint $table) {
            $table->dropForeign('FK_m_call_history_m_call_stages');
        });
    }
}
