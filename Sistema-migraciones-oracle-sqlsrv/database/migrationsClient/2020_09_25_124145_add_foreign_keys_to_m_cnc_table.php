<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMCncTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_cnc', function (Blueprint $table) {
            $table->foreign(array('agent_id'), 'FK_m_cnc_2')->references(array('agent_id'))->on('m_agents')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('cnc_brand_id'), 'FK_m_cnc_1')->references(array('cnc_brand_id'))->on('m_cnc_brands')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('tz_id'), 'FK_m_cnc_c_tz')->references(array('tz_id'))->on('c_tz')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_cnc', function (Blueprint $table) {
            $table->dropForeign('FK_m_cnc_2');
            $table->dropForeign('FK_m_cnc_1');
            $table->dropForeign('FK_m_cnc_c_tz');
        });
    }
}
