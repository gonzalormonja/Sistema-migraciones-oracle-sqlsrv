<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAReadingsOcurrencesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('a_readings_ocurrences', function (Blueprint $table) {
            $table->foreign(array('id_reading'), 'FK_a_readings_ocurrences_a_readings')->references(array('id'))->on('a_readings')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('id_ocurrence'), 'FK_a_readings_ocurrences_a_ocurrences')->references(array('id'))->on('a_ocurrences')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('a_readings_ocurrences', function (Blueprint $table) {
            $table->dropForeign('FK_a_readings_ocurrences_a_readings');
            $table->dropForeign('FK_a_readings_ocurrences_a_ocurrences');
        });
    }
}
