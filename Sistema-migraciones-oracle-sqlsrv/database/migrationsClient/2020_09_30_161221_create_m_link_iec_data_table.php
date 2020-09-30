<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMLinkIecDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_link_iec_data', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('PK_m_link_iec_data_m_link_iec_data');
            $table->integer('ph_conn_tout')->default(5000);
            $table->integer('retries')->default(3);
            $table->integer('tp')->default(50);
            $table->integer('tr')->default(100);
            $table->integer('dest_addr')->default(1);
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
        Schema::dropIfExists('m_link_iec_data');
    }
}
