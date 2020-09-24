<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMEventTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_event', function (Blueprint $table) {
            $table->foreign(array('event_id'), 'FK_m_event_1')->references(array('id'))->on('m_ev_desc_map')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_event', function (Blueprint $table) {
            $table->dropForeign('FK_m_event_1');
        });
    }
}
