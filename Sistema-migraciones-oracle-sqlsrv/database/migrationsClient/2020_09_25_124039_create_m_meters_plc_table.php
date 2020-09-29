<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMMetersPlcTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_meters_plc', function (Blueprint $table) {
            $table->increments('m_plc_id');
            $table->string('cnc_id', 32);
            $table->integer('report');
            $table->dateTime('fh_stamp');
            $table->string('meter_id', 32);
            $table->integer('com_status');
            $table->char('active', 1);
            $table->dateTime('last_time');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_meters_plc');
    }
}
