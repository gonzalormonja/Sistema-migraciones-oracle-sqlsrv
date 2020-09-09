<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMPortsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_ports', function (Blueprint $table) {
            $table->integer('port_id')->primary('PK_m_ports_m_ports');
            $table->integer('agent_id');
            $table->integer('port_type');
            $table->string('port_name', 16)->unique('IX_m_ports_m_ports');
            $table->integer('enable')->default(1);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_ports');
    }
}
