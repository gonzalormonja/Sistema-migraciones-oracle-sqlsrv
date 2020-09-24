<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMMetersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_meters', function (Blueprint $table) {
            $table->foreign(array('sched_id'), 'FK_m_meters_m_schedulers')->references(array('sched_id'))->on('m_schedulers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('brand_id'), 'FK_m_meters_m_meters_brands')->references(array('brand_id'))->on('m_meters_brands')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('phy_proto_id'), 'FK_m_meters_m_phy_protos')->references(array('proto_id'))->on('m_phy_protos')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('app_proto_id'), 'FK_m_meters_m_app_protos')->references(array('proto_id'))->on('m_app_protos')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('tz_id'), 'FK_m_meters_c_tz')->references(array('tz_id'))->on('c_tz')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('group_id'), 'FK_m_config_tasks_m_ports_groups')->references(array('group_id'))->on('m_ports_groups')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_meters', function (Blueprint $table) {
            $table->dropForeign('FK_m_meters_m_schedulers');
            $table->dropForeign('FK_m_meters_m_meters_brands');
            $table->dropForeign('FK_m_meters_m_phy_protos');
            $table->dropForeign('FK_m_meters_m_app_protos');
            $table->dropForeign('FK_m_meters_c_tz');
            $table->dropForeign('FK_m_config_tasks_m_ports_groups');
        });
    }
}
