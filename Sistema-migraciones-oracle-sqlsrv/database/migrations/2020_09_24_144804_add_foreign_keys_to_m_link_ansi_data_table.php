<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMLinkAnsiDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_link_ansi_data', function (Blueprint $table) {
            $table->foreign(array('meter_id'), 'FK_m_link_ansi_data_1')->references(array('meter_id'))->on('m_meters')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_link_ansi_data', function (Blueprint $table) {
            $table->dropForeign('FK_m_link_ansi_data_1');
        });
    }
}
