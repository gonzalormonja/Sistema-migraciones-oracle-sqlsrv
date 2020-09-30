<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMPortsGroupsDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_ports_groups_data', function (Blueprint $table) {
            $table->integer('group_id');
            $table->integer('port_id')->primary('PK_m_ports_groups_data_m_ports_groups_data');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_ports_groups_data');
    }
}
