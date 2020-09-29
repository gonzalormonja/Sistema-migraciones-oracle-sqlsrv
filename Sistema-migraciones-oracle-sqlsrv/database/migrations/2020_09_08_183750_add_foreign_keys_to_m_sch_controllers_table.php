<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMSchControllersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_sch_controllers', function (Blueprint $table) {
            $table->foreign(array('ip_addr'), 'FK_m_sch_controllers_m_lic_controllers')->references(array('ip_addr'))->on('m_lic_controllers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_sch_controllers', function (Blueprint $table) {
            $table->dropForeign('FK_m_sch_controllers_m_lic_controllers');
        });
    }
}
