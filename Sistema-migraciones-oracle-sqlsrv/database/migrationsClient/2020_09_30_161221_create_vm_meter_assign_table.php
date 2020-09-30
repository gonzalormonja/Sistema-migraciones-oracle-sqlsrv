<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVmMeterAssignTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vm_meter_assign', function (Blueprint $table) {
            $table->string('vm_meter_id', 32);
            $table->string('ph_meter_id', 32);
            $table->dateTime('fecha_assign');
            $table->integer('enable')->default(0);
            $table->string('ph_meter_point', 45);
            $table->primary(['vm_meter_id', 'ph_meter_id', 'ph_meter_point'], 'PK__vm_meter__77CFDE22954BB183_vm_meter_assign');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vm_meter_assign');
    }
}
