<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAgentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_agents', function (Blueprint $table) {
            $table->increments('agent_id');
            $table->string('agent_name', 32);
            $table->string('ip_addr', 16);
            $table->string('descr', 80)->nullable();
            $table->integer('enable')->default(1);
            $table->integer('agent_type');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_agents');
    }
}
