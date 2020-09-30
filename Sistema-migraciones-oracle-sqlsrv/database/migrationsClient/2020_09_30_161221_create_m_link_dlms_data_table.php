<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMLinkDlmsDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_link_dlms_data', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('PK_m_link_dlms_data_m_link_dlms_data');
            $table->integer('neg_i_len')->default(1);
            $table->integer('ph_conn_tout')->default(5000);
            $table->integer('len_rx')->default(128);
            $table->integer('len_tx')->default(128);
            $table->integer('w_rx')->default(7);
            $table->integer('w_tx')->default(7);
            $table->integer('retries')->default(3);
            $table->integer('tp')->default(50);
            $table->integer('tr')->default(100);
            $table->integer('src_addr_len')->default(1);
            $table->integer('src_addr_lower');
            $table->integer('src_addr_upper');
            $table->integer('dest_addr_len')->default(1);
            $table->integer('dest_addr_lower');
            $table->integer('dest_addr_upper');
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
        Schema::dropIfExists('m_link_dlms_data');
    }
}
