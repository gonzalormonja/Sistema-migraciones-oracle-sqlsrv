<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAMagnitudesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('a_magnitudes', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_anomalies');
            $table->string('name', 32);
            $table->string('type', 10);
            $table->integer('channel')->nullable();
            $table->string('formula', 5000)->nullable();
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
        Schema::dropIfExists('a_magnitudes');
    }
}
