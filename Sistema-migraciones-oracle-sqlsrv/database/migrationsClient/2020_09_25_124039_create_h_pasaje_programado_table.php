<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHPasajeProgramadoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('h_pasaje_programado', function (Blueprint $table) {
            $table->increments('pasaje_programado_id');
            $table->string('name')->nullable();
            $table->integer('server_id');
            $table->string('user_name');
            $table->string('table_name', 50);
            $table->integer('months_stored');
            $table->string('period', 50);
            $table->dateTime('start_exec');
            $table->dateTime('last_exec')->nullable();
            $table->integer('enabled');
            $table->integer('user_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('h_pasaje_programado');
    }
}
