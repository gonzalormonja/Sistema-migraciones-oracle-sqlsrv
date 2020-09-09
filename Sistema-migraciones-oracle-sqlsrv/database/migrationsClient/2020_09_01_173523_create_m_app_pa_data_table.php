<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAppPaDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_app_pa_data', function (Blueprint $table) {
            $table->string('meter_id', 32);
            $table->string('cnc_id', 32);
            $table->dateTime('fa')->nullable();
            $table->dateTime('fh')->nullable();
            $table->string('ns', 32)->nullable();
            $table->string('fab', 32)->nullable();
            $table->string('mod', 80)->nullable();
            $table->integer('af')->nullable();
            $table->string('te', 32)->nullable();
            $table->string('vf', 32)->nullable();
            $table->string('vprime', 32)->nullable();
            $table->string('pro', 32)->nullable();
            $table->string('idm', 32)->nullable();
            $table->string('mac', 18)->nullable();
            $table->integer('tp')->nullable();
            $table->integer('ts')->nullable();
            $table->integer('lp')->nullable();
            $table->integer('ls')->nullable();
            $table->string('clec', 32)->nullable();
            $table->string('cges', 32)->nullable();
            $table->string('cact', 32)->nullable();
            $table->integer('usag')->nullable();
            $table->integer('uswell')->nullable();
            $table->integer('per')->nullable();
            $table->float('dctcp', 53, 0)->nullable();
            $table->integer('vr')->nullable();
            $table->integer('ut')->nullable();
            $table->float('usubt', 53, 0)->nullable();
            $table->float('usobt', 53, 0)->nullable();
            $table->float('ucorteT', 53, 0)->nullable();
            $table->char('autMonthBill', 1)->nullable();
            $table->string('scrollDispMode', 12)->nullable();
            $table->integer('scrollDispTime')->nullable();
            $table->char('fuente', 1)->nullable();
            $table->primary(['meter_id', 'cnc_id'], 'pk_m_app_pa_m_app_pa_data');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_app_pa_data');
    }
}
