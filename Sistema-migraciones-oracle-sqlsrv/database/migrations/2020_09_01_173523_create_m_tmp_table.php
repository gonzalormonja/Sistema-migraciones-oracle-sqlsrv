<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMTmpTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_tmp', function (Blueprint $table) {
            $table->increments('m_register_id');
            $table->string('meter_id', 32);
            $table->integer('reg_descr_id');
            $table->dateTime('meter_t');
            $table->dateTime('local_t');
            $table->float('val', 53, 0);
            $table->string('raw_unit', 16);
            $table->integer('report');
            $table->string('cnc_id', 32);
            $table->integer('ctr');
            $table->integer('pt');
            $table->float('Ke', 53, 0);
            $table->float('val_factor', 53, 0);
            $table->string('unit', 16);
            $table->dateTime('meter_t_fhi')->nullable();
            $table->integer('origin_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_tmp');
    }
}
