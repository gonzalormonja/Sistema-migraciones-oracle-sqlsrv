<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMEventListCncTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_event_list_cnc', function (Blueprint $table) {
            $table->foreign(array('groupid_cnc'), 'FK_m_event_list_cnc')->references(array('id_ev_gp_cnc'))->on('m_event_group_cnc')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_event_list_cnc', function (Blueprint $table) {
            $table->dropForeign('FK_m_event_list_cnc');
        });
    }
}
