<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMHangersDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_hangers_data', function (Blueprint $table) {
            $table->foreign(array('hanger_id'), 'FK_m_hangers_data_1')->references(array('hanger_id'))->on('m_hangers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_hangers_data', function (Blueprint $table) {
            $table->dropForeign('FK_m_hangers_data_1');
        });
    }
}
