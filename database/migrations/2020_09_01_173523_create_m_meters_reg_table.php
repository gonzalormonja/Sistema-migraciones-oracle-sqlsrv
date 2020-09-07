<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMMetersRegTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_meters_reg', function (Blueprint $table) {
            $table->increments('m_reg_id');
            $table->string('cnc_id', 32);
            $table->integer('report');
            $table->string('meter_id', 32);
            $table->dateTime('reg_time');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_meters_reg');
    }
}
