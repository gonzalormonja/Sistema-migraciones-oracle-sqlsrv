<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMTaskGroupsTasksMapTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_task_groups_tasks_map', function (Blueprint $table) {
            $table->foreign(array('task_group_config'), 'FK_M_TASK_GROUPS_TASKS_MAP_CONFIG_ID')->references(array('groupal_task_id'))->on('m_task_groups_config')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_task_groups_tasks_map', function (Blueprint $table) {
            $table->dropForeign('FK_M_TASK_GROUPS_TASKS_MAP_CONFIG_ID');
        });
    }
}
