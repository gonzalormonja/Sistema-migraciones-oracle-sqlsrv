<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAReadingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('a_readings', function (Blueprint $table) {
            $table->increments('id');
            $table->string('id_meter', 32)->nullable();
            $table->dateTime('date_time')->nullable();
            $table->integer('channel')->nullable();
            $table->float('value', 53, 0)->nullable();
            $table->integer('origin')->nullable();
            $table->string('hash', 128)->unique('UQ__a_readin__43B15FA05979DA95_a_readings');
            $table->string('customer_name', 48)->nullable();
            $table->string('id_meter_point', 45)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('a_readings');
    }
}
