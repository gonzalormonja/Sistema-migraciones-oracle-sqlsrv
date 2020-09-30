<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMEventListCTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_event_list_c', function (Blueprint $table) {
            $table->foreign(array('groupid'), 'FK_m_event_list_c')->references(array('id_ev_gp'))->on('m_event_group_c')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_event_list_c', function (Blueprint $table) {
            $table->dropForeign('FK_m_event_list_c');
        });
    }
}
