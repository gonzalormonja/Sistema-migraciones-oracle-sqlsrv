<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMPhySerialDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_phy_serial_data', function (Blueprint $table) {
            $table->foreign(array('meter_id'), 'FK_m_phy_serial_data_m_meters')->references(array('meter_id'))->on('m_meters')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_phy_serial_data', function (Blueprint $table) {
            $table->dropForeign('FK_m_phy_serial_data_m_meters');
        });
    }
}
