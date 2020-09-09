<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMLinkVmDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_link_vm_data', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('PK_m_link_vm_data_m_link_vm_data');
            $table->integer('src_addr');
            $table->integer('dst_addr');
            $table->integer('pdu_size');
            $table->integer('ph_conn_tout');
            $table->integer('retries');
            $table->integer('tr');
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
        Schema::dropIfExists('m_link_vm_data');
    }
}
