<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAppPmlDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_app_pml_data', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('PK_m_app_pml_data_m_app_pml_data');
            $table->string('password', 104)->nullable();
            $table->integer('log_level');
            $table->string('serial_number', 32);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_app_pml_data');
    }
}
