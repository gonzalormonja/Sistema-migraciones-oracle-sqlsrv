<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAppAnsiDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_app_ansi_data', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('PK_m_app_ansi_data_m_app_ansi_data');
            $table->string('password', 104)->nullable();
            $table->integer('log_level');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_app_ansi_data');
    }
}
