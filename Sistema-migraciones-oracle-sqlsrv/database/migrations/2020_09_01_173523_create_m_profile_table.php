<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMProfileTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_profile', function (Blueprint $table) {
            $table->increments('m_profile_id');
            $table->string('meter_id', 32);
            $table->dateTime('meter_t0');
            $table->dateTime('meter_tf');
            $table->dateTime('local_t0');
            $table->dateTime('local_tf');
            $table->integer('channel');
            $table->integer('reg_descr_id');
            $table->integer('qualifier');
            $table->float('val', 53, 0);
            $table->string('raw_unit', 16)->nullable();
            $table->float('val_demand', 53, 0);
            $table->float('val_edit', 53, 0);
            $table->float('val_factor', 53, 0);
            $table->integer('report')->default(-1);
            $table->string('cnc_id', 32)->default('-1');
            $table->string('reg_quality', 8)->default('-1');
            $table->float('Ke', 53, 0);
            $table->string('unit', 16)->default('');
            $table->integer('origin_id')->nullable()->default(1);
            $table->dateTime('datetime_pc')->useCurrent();
            $table->unique(['meter_id', 'meter_t0', 'channel', 'reg_descr_id', 'report'], 'IX_m_profile_m_profile');
            $table->index(['meter_t0', 'local_t0', 'reg_descr_id', 'val', 'raw_unit', 'val_demand', 'val_edit', 'val_factor', 'unit', 'meter_id'], '<UX_C_PROFILE>_m_profile');
            $table->index(['meter_id', 'meter_t0', 'meter_tf', 'local_t0', 'local_tf', 'channel', 'reg_descr_id', 'qualifier', 'val', 'raw_unit', 'val_demand', 'val_edit', 'val_factor', 'report', 'cnc_id', 'reg_quality', 'Ke', 'unit', 'origin_id', 'datetime_pc'], 'IX_m_profile_datetime_pc_m_profile');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_profile');
    }
}
