<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMTaskGroupsTasksMapTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_task_groups_tasks_map', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('task_group_config');
            $table->integer('m_config_tasks_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_task_groups_tasks_map');
    }
}
