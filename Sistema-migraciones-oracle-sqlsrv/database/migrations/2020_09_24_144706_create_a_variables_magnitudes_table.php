<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAVariablesMagnitudesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('a_variables_magnitudes', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_magnitude');
            $table->string('name', 32);
            $table->integer('channel');
            $table->dateTime('date_start')->nullable();
            $table->dateTime('date_end')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('a_variables_magnitudes');
    }
}
