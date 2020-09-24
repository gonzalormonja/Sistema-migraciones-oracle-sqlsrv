<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMEventCncTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_event_cnc', function (Blueprint $table) {
            $table->foreign(array('event_cnc_id'), 'FK_m_event_1_cnc')->references(array('id_ev_cnc'))->on('m_ev_desc_map_cnc')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_event_cnc', function (Blueprint $table) {
            $table->dropForeign('FK_m_event_1_cnc');
        });
    }
}
