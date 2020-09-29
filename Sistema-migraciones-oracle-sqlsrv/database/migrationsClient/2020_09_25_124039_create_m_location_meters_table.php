<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMLocationMetersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_location_meters', function (Blueprint $table) {
            $table->string('id_meter_point', 45);
            $table->string('meter_id', 32)->index('idx_m_location_meters_meter_id_m_location_meters');
            $table->dateTime('active_date');
            $table->dateTime('deactiv_date')->nullable();
            $table->primary(['id_meter_point', 'meter_id', 'active_date'], 'PK__m_locati__D56162B4279368FD_m_location_meters');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_location_meters');
    }
}
