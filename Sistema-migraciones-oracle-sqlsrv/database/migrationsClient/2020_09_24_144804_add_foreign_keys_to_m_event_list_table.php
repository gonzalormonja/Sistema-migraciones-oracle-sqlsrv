<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMEventListTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_event_list', function (Blueprint $table) {
            $table->foreign(array('groupid','subgroup'), 'FK_m_event_list')->references(array('id_ev_gp','subgroup'))->on('m_event_group')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_event_list', function (Blueprint $table) {
            $table->dropForeign('FK_m_event_list');
        });
    }
}
