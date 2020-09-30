<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMTOUTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_TOU', function (Blueprint $table) {
            $table->increments('ID_TOU');
            $table->integer('ID_calendar');
            $table->integer('ID_day_type');
            $table->integer('Year_ini');
            $table->integer('Month_ini');
            $table->integer('Day_ini');
            $table->integer('Year_fin');
            $table->integer('Month_fin');
            $table->integer('Day_fin');
            $table->integer('Type_tou');
            $table->string('Descr', 50)->nullable();
            $table->bigInteger('ID_date');
            $table->primary(['ID_calendar', 'ID_day_type', 'Year_ini', 'Month_ini', 'Day_ini', 'ID_date'], 'PK__m_TOU__112F9C4810DDBAF0_m_TOU');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_TOU');
    }
}
