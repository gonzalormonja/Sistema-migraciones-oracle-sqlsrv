<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMPhySerialDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_phy_serial_data', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('PK_m_phy_serial_data_m_phy_serial_data');
            $table->string('tel_number', 32)->nullable();
            $table->integer('log_level')->default(0);
            $table->integer('baudrate')->default(9600);
            $table->integer('flow_ctrl')->default(1);
            $table->string('modem_init', 32);
            $table->string('modem_hang', 32);
            $table->integer('parity')->default(0);
            $table->integer('bits')->default(8);
            $table->integer('stop')->default(1);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_phy_serial_data');
    }
}
