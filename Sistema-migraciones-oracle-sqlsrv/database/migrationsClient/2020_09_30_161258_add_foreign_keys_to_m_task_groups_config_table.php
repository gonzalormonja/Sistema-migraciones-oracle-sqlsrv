<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMTaskGroupsConfigTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_task_groups_config', function (Blueprint $table) {
            $table->foreign(array('group_id'), 'FK_M_TASK_GROUPS_TASK_GROUP')->references(array('task_group_id'))->on('m_task_groups')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_task_groups_config', function (Blueprint $table) {
            $table->dropForeign('FK_M_TASK_GROUPS_TASK_GROUP');
        });
    }
}
