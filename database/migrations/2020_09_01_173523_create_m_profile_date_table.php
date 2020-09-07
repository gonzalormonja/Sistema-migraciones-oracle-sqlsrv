<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMProfileDateTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_profile_date', function (Blueprint $table) {
            $table->string('meter_id', 32);
            $table->dateTime('meter_t0_date');
            $table->unique(['meter_id', 'meter_t0_date'], 'IX_m_profile_date_m_profile_date');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_profile_date');
    }
}
