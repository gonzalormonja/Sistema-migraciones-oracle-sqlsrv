<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMTaskGroupsUserGroupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_task_groups_user_groups', function (Blueprint $table) {
            $table->foreign(array('task_group_id'), 'FK_M_TASK_GROUPS_USER_TASK_GROUP')->references(array('task_group_id'))->on('m_task_groups')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('user_group_id'), 'FK_M_TASK_GROUPS_USER_GROUPS_USER_GROUP')->references(array('group_id'))->on('m_groups')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_task_groups_user_groups', function (Blueprint $table) {
            $table->dropForeign('FK_M_TASK_GROUPS_USER_TASK_GROUP');
            $table->dropForeign('FK_M_TASK_GROUPS_USER_GROUPS_USER_GROUP');
        });
    }
}
