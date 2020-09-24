<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVmProfileTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vm_profile', function (Blueprint $table) {
            $table->increments('vm_profile_id');
            $table->string('vm_meter_id', 32);
            $table->integer('channel_id');
            $table->dateTime('meter_t0');
            $table->integer('qualifier');
            $table->float('val', 53, 0);
            $table->string('raw_unit', 16);
            $table->float('val_demand', 53, 0);
            $table->float('val_edit', 53, 0);
            $table->float('val_factor', 53, 0);
            $table->string('unit', 16);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vm_profile');
    }
}
