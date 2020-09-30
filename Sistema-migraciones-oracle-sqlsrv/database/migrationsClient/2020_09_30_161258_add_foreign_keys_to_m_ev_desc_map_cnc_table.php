<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMEvDescMapCncTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_ev_desc_map_cnc', function (Blueprint $table) {
            $table->foreign(array('app_cnc_id'), 'FK_m_ev_desc_map_2__2_cnc2')->references(array('ev_app_cnc_id'))->on('m_ev_map_cnc')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('cnc_id'), 'FK_m_ev_desc_map_m_cnc2')->references(array('cnc_id'))->on('m_cnc')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_ev_desc_map_cnc', function (Blueprint $table) {
            $table->dropForeign('FK_m_ev_desc_map_2__2_cnc2');
            $table->dropForeign('FK_m_ev_desc_map_m_cnc2');
        });
    }
}
