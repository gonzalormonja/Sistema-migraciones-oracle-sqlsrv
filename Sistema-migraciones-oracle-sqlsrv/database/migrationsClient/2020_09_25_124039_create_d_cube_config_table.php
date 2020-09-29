<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDCubeConfigTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('d_cube_config', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('main_filter', 30);
            $table->integer('max_reg_gen');
            $table->string('max_from_gen', 30);
            $table->time('day_exec_time');
            $table->integer('max_reg_day_exec');
            $table->integer('max_saving_reg');
            $table->string('prompt_wait_time', 12);
            $table->integer('max_reg_render');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('d_cube_config');
    }
}
