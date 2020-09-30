<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMLoggersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_loggers', function (Blueprint $table) {
            $table->increments('id');
            $table->string('log_ip_addr', 16)->unique('UK_m_loggers_m_loggers');
            $table->integer('log_port');
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
        Schema::dropIfExists('m_loggers');
    }
}
