<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAAnomaliesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('a_anomalies', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 32);
            $table->boolean('active');
            $table->string('observations', 128)->nullable();
            $table->boolean('allow_graphic')->default(1);
            $table->integer('max_ocurrences')->default(100);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('a_anomalies');
    }
}
