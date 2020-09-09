<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMCalendarTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_calendar', function (Blueprint $table) {
            $table->increments('ID_calendar');
            $table->integer('ID_season')->nullable();
            $table->string('name', 50)->nullable();
            $table->string('descr', 100)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_calendar');
    }
}
