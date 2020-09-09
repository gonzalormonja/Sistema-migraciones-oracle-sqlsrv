<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAMetersMagnitudesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('a_meters_magnitudes', function (Blueprint $table) {
            $table->foreign(array('id_meter'), 'FK_a_meters_magnitudes_m_meters')->references(array('meter_id'))->on('m_meters')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('a_meters_magnitudes', function (Blueprint $table) {
            $table->dropForeign('FK_a_meters_magnitudes_m_meters');
        });
    }
}
