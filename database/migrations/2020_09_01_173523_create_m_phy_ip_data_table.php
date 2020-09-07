<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMPhyIpDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_phy_ip_data', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('PK_m_m_phy_ip_data_m_phy_ip_data');
            $table->string('remote_ip', 15);
            $table->integer('remote_port');
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
        Schema::dropIfExists('m_phy_ip_data');
    }
}
