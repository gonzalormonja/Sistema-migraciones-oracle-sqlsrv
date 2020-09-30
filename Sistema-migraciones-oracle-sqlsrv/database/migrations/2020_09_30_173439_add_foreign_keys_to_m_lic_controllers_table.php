<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMLicControllersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_lic_controllers', function (Blueprint $table) {
            $table->foreign(array('log_ip'), 'FK_m_loggers_m_lic_controllers')->references(array('log_ip_addr'))->on('m_loggers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('monitor_ip'), 'FK_m_monitors_m_lic_controllers')->references(array('mon_ip_addr'))->on('m_monitors')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_lic_controllers', function (Blueprint $table) {
            $table->dropForeign('FK_m_loggers_m_lic_controllers');
            $table->dropForeign('FK_m_monitors_m_lic_controllers');
        });
    }
}
