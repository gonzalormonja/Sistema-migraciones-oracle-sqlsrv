<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAOcurrencesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('a_ocurrences', function (Blueprint $table) {
            $table->foreign(array('id_magnitudes'), 'FK_a_ocurrences_a_magnitudes')->references(array('id'))->on('a_magnitudes')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('a_ocurrences', function (Blueprint $table) {
            $table->dropForeign('FK_a_ocurrences_a_magnitudes');
        });
    }
}
