<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMLinkSchlDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_link_schl_data', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('m_link_schl_data1_m_link_schl_data');
            $table->integer('ph_conn_tout');
            $table->integer('retries');
            $table->integer('tr');
            $table->integer('log_level');
            $table->integer('address');
            $table->integer('switch_delay');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_link_schl_data');
    }
}
