<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMManagedCncListTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_managed_cnc_list', function (Blueprint $table) {
            $table->string('cnc_id', 32);
            $table->string('cnc_url', 1024);
            $table->string('cnc_folder', 1024);
            $table->integer('agent_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_managed_cnc_list');
    }
}
