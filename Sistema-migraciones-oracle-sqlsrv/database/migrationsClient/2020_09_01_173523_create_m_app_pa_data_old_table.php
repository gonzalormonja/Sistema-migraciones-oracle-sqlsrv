<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAppPaDataOldTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_app_pa_data_old', function (Blueprint $table) {
            $table->string('meter_id', 32);
            $table->string('cnc_id', 32);
            $table->string('serial', 32)->nullable();
            $table->integer('active')->nullable();
            $table->integer('status')->nullable();
            $table->dateTime('date_act')->nullable();
            $table->string('fab', 15)->nullable();
            $table->string('Mod', 15)->nullable();
            $table->integer('af')->nullable();
            $table->string('protocolo', 32)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_app_pa_data_old');
    }
}
