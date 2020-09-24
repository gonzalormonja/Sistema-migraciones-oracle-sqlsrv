<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateXUserDefinedTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('x_user_defined', function (Blueprint $table) {
            $table->increments('ud_id');
            $table->string('ud_table', 32)->nullable();
            $table->string('ud_name', 32)->nullable();
            $table->string('ud_visible_name', 48)->nullable();
            $table->string('ud_description', 128)->nullable();
            $table->string('ud_type', 32)->nullable();
            $table->integer('ud_long')->nullable();
            $table->string('ud_default_value', 128)->nullable();
            $table->string('ud_tipo_componente', 150)->nullable();
            $table->string('ud_consulta', 512)->nullable();
            $table->string('ud_values', 256)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('x_user_defined');
    }
}
