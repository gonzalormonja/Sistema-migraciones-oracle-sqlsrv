<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMDialersDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_dialers_data', function (Blueprint $table) {
            $table->foreign(array('dialer_id'), 'FK_m_dialers_data_m_dialers')->references(array('dialer_id'))->on('m_dialers')->onUpdate('CASCADE')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_dialers_data', function (Blueprint $table) {
            $table->dropForeign('FK_m_dialers_data_m_dialers');
        });
    }
}
