<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMPortsGroupsDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_ports_groups_data', function (Blueprint $table) {
            $table->foreign(array('group_id'), 'FK_m_ports_groups_data_m_ports_groups')->references(array('group_id'))->on('m_ports_groups')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('port_id'), 'FK_m_ports_groups_data_1')->references(array('port_id'))->on('m_ports')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_ports_groups_data', function (Blueprint $table) {
            $table->dropForeign('FK_m_ports_groups_data_m_ports_groups');
            $table->dropForeign('FK_m_ports_groups_data_1');
        });
    }
}
