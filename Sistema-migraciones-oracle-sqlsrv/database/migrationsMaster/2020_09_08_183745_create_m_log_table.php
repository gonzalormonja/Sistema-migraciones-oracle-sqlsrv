<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMLogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_log', function (Blueprint $table) {
            $table->dateTime('ts');
            $table->string('severity', 2);
            $table->string('origin', 8);
            $table->string('ip_addr', 16);
            $table->integer('client_id');
            $table->integer('entity_id');
            $table->integer('port_id');
            $table->integer('task_id');
            $table->integer('task_id_int');
            $table->string('meter_id', 33);
            $table->string('msg', 256)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_log');
    }
}
