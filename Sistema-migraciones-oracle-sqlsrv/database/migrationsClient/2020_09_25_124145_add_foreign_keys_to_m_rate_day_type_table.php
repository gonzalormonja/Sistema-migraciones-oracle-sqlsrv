<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMRateDayTypeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_rate_day_type', function (Blueprint $table) {
            $table->foreign(array('ID_day_type'), 'FK_m_rate_day_type_1')->references(array('ID_day_type'))->on('m_day_type')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('ID_rate'), 'FK_m_rate_day_type_2')->references(array('ID_rate'))->on('m_rate')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_rate_day_type', function (Blueprint $table) {
            $table->dropForeign('FK_m_rate_day_type_1');
            $table->dropForeign('FK_m_rate_day_type_2');
        });
    }
}
