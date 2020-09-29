<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMRateDayTypeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_rate_day_type', function (Blueprint $table) {
            $table->increments('id_rate_day_type');
            $table->integer('ID_day_type');
            $table->integer('ID_rate');
            $table->integer('Hour_ini');
            $table->integer('Minute_ini');
            $table->integer('Hour_fin');
            $table->integer('Minute_fin');
            $table->primary(['id_rate_day_type', 'ID_day_type', 'ID_rate', 'Hour_ini', 'Minute_ini', 'Hour_fin', 'Minute_fin'], 'PK__m_rate_d__4C05B05DC87CC574_m_rate_day_type');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_rate_day_type');
    }
}
