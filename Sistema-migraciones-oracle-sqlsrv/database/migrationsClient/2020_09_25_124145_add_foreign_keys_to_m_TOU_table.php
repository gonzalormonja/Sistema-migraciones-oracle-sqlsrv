<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMTOUTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_TOU', function (Blueprint $table) {
            $table->foreign(array('ID_calendar'), 'FK_m_TOU_1')->references(array('ID_calendar'))->on('m_calendar')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('ID_day_type'), 'FK_m_TOU_2')->references(array('ID_day_type'))->on('m_day_type')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_TOU', function (Blueprint $table) {
            $table->dropForeign('FK_m_TOU_1');
            $table->dropForeign('FK_m_TOU_2');
        });
    }
}
