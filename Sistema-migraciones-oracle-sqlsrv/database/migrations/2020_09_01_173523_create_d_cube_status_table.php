<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDCubeStatusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('d_cube_status', function (Blueprint $table) {
            $table->increments('ID');
            $table->string('main_filter', 30);
            $table->string('run_by', 50);
            $table->dateTime('start');
            $table->dateTime('beat')->useCurrent();
            $table->smallInteger('status');
            $table->string('filepath', 400)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('d_cube_status');
    }
}
