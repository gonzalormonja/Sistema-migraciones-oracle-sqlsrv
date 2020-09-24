<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAMagnitudesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('a_magnitudes', function (Blueprint $table) {
            $table->foreign(array('id_anomalies'), 'FK_a_magnitudes_a_anomalies')->references(array('id'))->on('a_anomalies')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('a_magnitudes', function (Blueprint $table) {
            $table->dropForeign('FK_a_magnitudes_a_anomalies');
        });
    }
}
