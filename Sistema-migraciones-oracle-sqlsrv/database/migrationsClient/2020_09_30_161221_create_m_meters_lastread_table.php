<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMMetersLastreadTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_meters_lastread', function (Blueprint $table) {
            $table->string('meter_id', 32);
            $table->dateTime('last_read');
            $table->integer('reg_type');
            $table->integer('log')->default(0);
            $table->integer('per')->nullable();
            $table->integer('logdefault')->nullable()->default(0);
            $table->primary(['meter_id', 'reg_type', 'log'], 'PK__m_meters__E2229A1E1ED6F8A0_m_meters_lastread');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_meters_lastread');
    }
}
