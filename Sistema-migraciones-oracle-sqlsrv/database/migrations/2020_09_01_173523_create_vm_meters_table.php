<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVmMetersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vm_meters', function (Blueprint $table) {
            $table->string('vm_meter_id', 32)->primary('PK__vm_meter__3470AC77EF5115F4_vm_meters');
            $table->string('descripcion', 64)->nullable();
            $table->integer('n_channels')->default(1);
            $table->dateTime('fecha_update');
            $table->integer('per')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vm_meters');
    }
}
