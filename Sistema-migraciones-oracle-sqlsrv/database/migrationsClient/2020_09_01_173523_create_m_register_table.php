<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMRegisterTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_register', function (Blueprint $table) {
            $table->increments('m_register_id');
            $table->string('meter_id', 32);
            $table->integer('reg_descr_id');
            $table->dateTime('meter_t');
            $table->dateTime('local_t');
            $table->float('val', 53, 0);
            $table->string('raw_unit', 16);
            $table->integer('report')->default(-1);
            $table->string('cnc_id', 32)->default('-1');
            $table->integer('ctr')->default(-1);
            $table->integer('pt')->default(-1);
            $table->float('Ke', 53, 0);
            $table->float('val_factor', 53, 0);
            $table->string('unit', 16)->default('');
            $table->dateTime('meter_t_fhi')->nullable();
            $table->integer('origin_id')->default(1);
            $table->dateTime('datetime_pc')->useCurrent();
            $table->unique(['meter_id', 'reg_descr_id', 'meter_t', 'ctr', 'pt'], 'IX_m_register_m_register');
            $table->index(['meter_id', 'reg_descr_id', 'meter_t', 'local_t', 'val', 'raw_unit', 'report', 'cnc_id', 'ctr', 'pt', 'Ke', 'val_factor', 'unit', 'meter_t_fhi', 'origin_id', 'datetime_pc'], 'IX_m_register_datetime_pc_m_register');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_register');
    }
}
