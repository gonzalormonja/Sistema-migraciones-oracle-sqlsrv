<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAMetersVariablesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('a_meters_variables', function (Blueprint $table) {
            $table->foreign(array('id_meter'), 'FK_a_meters_variables_m_meters')->references(array('meter_id'))->on('m_meters')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('id_variables_magnitude'), 'FK_a_meters_variables_a_variables_magnitude')->references(array('id'))->on('a_variables_magnitudes')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('a_meters_variables', function (Blueprint $table) {
            $table->dropForeign('FK_a_meters_variables_m_meters');
            $table->dropForeign('FK_a_meters_variables_a_variables_magnitude');
        });
    }
}
