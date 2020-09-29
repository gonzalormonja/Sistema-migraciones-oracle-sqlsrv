<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMTaskGroupsLocationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_task_groups_locations', function (Blueprint $table) {
            $table->foreign(array('id_meter_point'), 'FK_TASK_GROUPS_LOCATIONS_METER_POINT')->references(array('id_meter_point'))->on('m_location')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('id_task_group'), 'FK_TASK_GROUPS_LOCATIONS_TASK_GROUP')->references(array('task_group_id'))->on('m_task_groups')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_task_groups_locations', function (Blueprint $table) {
            $table->dropForeign('FK_TASK_GROUPS_LOCATIONS_METER_POINT');
            $table->dropForeign('FK_TASK_GROUPS_LOCATIONS_TASK_GROUP');
        });
    }
}
