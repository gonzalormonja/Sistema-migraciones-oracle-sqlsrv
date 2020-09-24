<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMLinkIec62056DataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_link_iec62056_data', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('PK__m_link_i__6647C31598F04BC9_m_link_iec62056_data');
            $table->string('address', 32);
            $table->integer('silent_time');
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
        Schema::dropIfExists('m_link_iec62056_data');
    }
}
