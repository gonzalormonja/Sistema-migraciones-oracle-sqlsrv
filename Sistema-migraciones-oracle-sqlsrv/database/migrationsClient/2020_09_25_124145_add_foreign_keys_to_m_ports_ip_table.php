<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMPortsIpTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_ports_ip', function (Blueprint $table) {
            $table->foreign(array('port_id'), 'FK_m_ports_ip_m_ports')->references(array('port_id'))->on('m_ports')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_ports_ip', function (Blueprint $table) {
            $table->dropForeign('FK_m_ports_ip_m_ports');
        });
    }
}
