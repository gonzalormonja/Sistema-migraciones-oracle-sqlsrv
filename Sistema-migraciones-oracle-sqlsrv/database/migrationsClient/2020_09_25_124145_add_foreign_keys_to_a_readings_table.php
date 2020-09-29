<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAReadingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('a_readings', function (Blueprint $table) {
            $table->foreign(array('channel'), 'FK_a_readings_channel')->references(array('prof_app_id'))->on('m_prof_map')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('a_readings', function (Blueprint $table) {
            $table->dropForeign('FK_a_readings_channel');
        });
    }
}
