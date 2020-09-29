<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMLocationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_location', function (Blueprint $table) {
            $table->foreign(array('group_id'), 'FK_m_location_2')->references(array('group_id'))->on('m_groups')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('customer_id'), 'FK_m_location_1')->references(array('customer_id'))->on('c_customers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('id_city'), 'FK_m_location')->references(array('id'))->on('c_city')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_location', function (Blueprint $table) {
            $table->dropForeign('FK_m_location_2');
            $table->dropForeign('FK_m_location_1');
            $table->dropForeign('FK_m_location');
        });
    }
}
