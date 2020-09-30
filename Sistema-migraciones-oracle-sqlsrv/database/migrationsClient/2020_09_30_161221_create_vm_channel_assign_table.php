<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVmChannelAssignTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vm_channel_assign', function (Blueprint $table) {
            $table->string('vm_meter_id', 32);
            $table->integer('vm_channel_id');
            $table->string('ph_meter_id', 32);
            $table->integer('ph_channel_id');
            $table->float('multiplier', 53, 0)->default(1);
            $table->string('ph_meter_point', 45);
            $table->primary(['vm_meter_id', 'vm_channel_id', 'ph_meter_id', 'ph_channel_id', 'ph_meter_point'], 'PK__vm_chann__8B6FFFB2D0A7C06D_vm_channel_assign');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vm_channel_assign');
    }
}
