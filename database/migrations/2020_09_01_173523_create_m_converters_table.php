<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMConvertersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_converters', function (Blueprint $table) {
            $table->integer('conv_id')->primary('PK_m_unpackers_m_converters');
            $table->string('conv_name', 32);
            $table->integer('sched_id');
            $table->string('ip_addr', 16);
            $table->integer('port')->nullable();
            $table->integer('share_id');
            $table->integer('max_old_time');
            $table->integer('enable');
            $table->integer('log_level');
            $table->integer('rows_per_batch');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_converters');
    }
}
