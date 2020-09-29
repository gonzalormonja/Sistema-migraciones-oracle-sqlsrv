<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAMetersMagnitudesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('a_meters_magnitudes', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_magnitude');
            $table->string('id_meter', 32);
            $table->integer('channel');
            $table->float('min', 53, 0);
            $table->float('max', 53, 0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('a_meters_magnitudes');
    }
}
