<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMReleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_rele', function (Blueprint $table) {
            $table->string('meter_id', 32);
            $table->string('cnc_id', 32);
            $table->integer('command');
            $table->dateTime('time_ej');
            $table->integer('result');
            $table->integer('state');
            $table->integer('user_id')->nullable();
            $table->integer('task_id');
            $table->string('user_name', 45)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_rele');
    }
}
