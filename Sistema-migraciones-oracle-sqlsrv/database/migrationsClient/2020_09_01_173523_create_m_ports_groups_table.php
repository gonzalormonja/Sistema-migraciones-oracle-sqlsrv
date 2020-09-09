<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMPortsGroupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_ports_groups', function (Blueprint $table) {
            $table->increments('group_id');
            $table->string('group_name', 32)->unique('IX_m_port_groups_m_ports_groups');
            $table->integer('group_type');
            $table->string('descr', 80)->nullable();
            $table->integer('group_op_mode')->default(1);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_ports_groups');
    }
}
