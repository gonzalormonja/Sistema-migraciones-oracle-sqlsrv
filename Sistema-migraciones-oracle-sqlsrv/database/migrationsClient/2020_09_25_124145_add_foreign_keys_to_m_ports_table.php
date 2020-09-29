<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMPortsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_ports', function (Blueprint $table) {
            $table->foreign(array('agent_id'), 'FK_m_ports_m_agents')->references(array('agent_id'))->on('m_agents')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('port_type'), 'FK_m_ports_m_phy_protos')->references(array('proto_id'))->on('m_phy_protos')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_ports', function (Blueprint $table) {
            $table->dropForeign('FK_m_ports_m_agents');
            $table->dropForeign('FK_m_ports_m_phy_protos');
        });
    }
}
