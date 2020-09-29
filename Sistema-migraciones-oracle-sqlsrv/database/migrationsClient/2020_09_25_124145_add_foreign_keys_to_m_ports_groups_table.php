<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMPortsGroupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_ports_groups', function (Blueprint $table) {
            $table->foreign(array('group_type'), 'FK_m_ports_groups_m_phy_protos')->references(array('proto_id'))->on('m_phy_protos')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_ports_groups', function (Blueprint $table) {
            $table->dropForeign('FK_m_ports_groups_m_phy_protos');
        });
    }
}
