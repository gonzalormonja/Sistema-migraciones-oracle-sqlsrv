<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMSchcClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_schc_clients', function (Blueprint $table) {
            $table->foreign(array('ip_addr'), 'FK_m_schc_clients_m_sch_controllers')->references(array('ip_addr'))->on('m_sch_controllers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_schc_clients', function (Blueprint $table) {
            $table->dropForeign('FK_m_schc_clients_m_sch_controllers');
        });
    }
}
