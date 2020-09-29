<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMLocationMetersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_location_meters', function (Blueprint $table) {
            $table->foreign(array('id_meter_point'), 'FK_m_location_meters_1')->references(array('id_meter_point'))->on('m_location')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_location_meters', function (Blueprint $table) {
            $table->dropForeign('FK_m_location_meters_1');
        });
    }
}
