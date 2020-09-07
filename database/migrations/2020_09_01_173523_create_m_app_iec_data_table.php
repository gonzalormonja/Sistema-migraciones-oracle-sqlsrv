<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAppIecDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_app_iec_data', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('PK_m_app_iec_data_m_app_iec_data');
            $table->integer('address')->default(1);
            $table->string('password', 104)->nullable();
            $table->integer('log_level')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_app_iec_data');
    }
}
