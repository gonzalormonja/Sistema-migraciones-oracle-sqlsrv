<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMPortsSerialTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_ports_serial', function (Blueprint $table) {
            $table->foreign(array('port_id'), 'FK_m_ports_serial_m_ports')->references(array('port_id'))->on('m_ports')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('dialer_id'), 'FK_m_ports_serial_m_dialers')->references(array('dialer_id'))->on('m_dialers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('hanger_id'), 'FK_m_ports_serial_2')->references(array('hanger_id'))->on('m_hangers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_ports_serial', function (Blueprint $table) {
            $table->dropForeign('FK_m_ports_serial_m_ports');
            $table->dropForeign('FK_m_ports_serial_m_dialers');
            $table->dropForeign('FK_m_ports_serial_2');
        });
    }
}
