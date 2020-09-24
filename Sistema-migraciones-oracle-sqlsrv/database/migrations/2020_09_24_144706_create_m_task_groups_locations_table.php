<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMTaskGroupsLocationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_task_groups_locations', function (Blueprint $table) {
            $table->string('id_meter_point', 45);
            $table->integer('id_task_group');
            $table->unique(['id_task_group', 'id_meter_point'], 'UQ_M_TASK_GROUPS_LOCATIONS_m_task_groups_locations');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_task_groups_locations');
    }
}
