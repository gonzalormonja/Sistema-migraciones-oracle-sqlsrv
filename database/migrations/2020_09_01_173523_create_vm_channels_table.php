<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVmChannelsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vm_channels', function (Blueprint $table) {
            $table->string('vm_meter_id', 32);
            $table->integer('vm_channel_id');
            $table->string('descripcion', 64)->nullable();
            $table->string('unidad', 16);
            $table->primary(['vm_meter_id', 'vm_channel_id'], 'PK__vm_chann__DDA4EED8C7B58803_vm_channels');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vm_channels');
    }
}
