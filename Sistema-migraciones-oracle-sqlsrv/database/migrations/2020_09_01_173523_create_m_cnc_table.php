<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMCncTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_cnc', function (Blueprint $table) {
            $table->string('cnc_id', 32)->primary('PK__m_cnc__E2E24E3E55F1ADEC_m_cnc');
            $table->string('cnc_description', 80);
            $table->string('cnc_url', 1024);
            $table->string('cnc_folder', 1024);
            $table->integer('agent_id');
            $table->integer('cnc_brand_id');
            $table->integer('tz')->default(-3);
            $table->integer('dst');
            $table->string('ftp_srv_ip', 16);
            $table->integer('ftp_srv_port');
            $table->string('ftp_srv_user', 50);
            $table->string('ftp_srv_pass', 50);
            $table->integer('ftp_access_mode');
            $table->integer('tz_id')->nullable();
            $table->integer('maxcnccallduration')->nullable();
            $table->integer('group_id')->default(1);
            $table->integer('ftp_tout_sec')->default(60);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_cnc');
    }
}
