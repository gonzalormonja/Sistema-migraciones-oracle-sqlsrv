<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMLinkPmlDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_link_pml_data', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('PK__m_link_p__6647C3156FC634E3_m_link_pml_data');
            $table->integer('src_addr');
            $table->integer('dest_addr');
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
        Schema::dropIfExists('m_link_pml_data');
    }
}
