<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMMetersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_meters', function (Blueprint $table) {
            $table->integer('sched_id')->nullable();
            $table->string('meter_id', 32)->primary('PK_m_meters_m_meters');
            $table->integer('brand_id');
            $table->integer('tz')->default(-3);
            $table->dateTime('prof_last_read')->nullable();
            $table->dateTime('eob_last_read')->nullable();
            $table->dateTime('reg_last_read')->nullable();
            $table->dateTime('ev_last_read')->nullable();
            $table->integer('phy_proto_id');
            $table->integer('app_proto_id');
            $table->integer('log_level')->default(0);
            $table->integer('m_enable')->nullable();
            $table->integer('tz_id')->nullable();
            $table->float('TU', 53, 0)->default(1);
            $table->float('TP', 53, 0)->default(1);
            $table->integer('switch_state')->nullable();
            $table->dateTime('switch_state_date')->nullable();
            $table->integer('is_pulse')->nullable();
            $table->integer('master')->nullable();
            $table->string('master_meter_id', 32)->nullable();
            $table->dateTime('last_prn_gen')->nullable();
            $table->string('prn_channels', 500)->nullable();
            $table->integer('ami')->nullable();
            $table->integer('group_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_meters');
    }
}
