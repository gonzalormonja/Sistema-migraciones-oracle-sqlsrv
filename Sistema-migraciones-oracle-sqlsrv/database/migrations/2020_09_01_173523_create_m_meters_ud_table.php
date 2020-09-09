<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMMetersUdTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_meters_ud', function (Blueprint $table) {
            $table->string('meter_id', 32)->primary('PK_m_meters_ud_m_meters_ud');
            $table->string('TARIFA', 40)->nullable()->default('T1');
            $table->string('POTENCIA', 40)->nullable()->default('');
            $table->string('ZONA', 40)->nullable()->default('');
            $table->integer('FACT')->nullable()->default(0);
            $table->string('CHASIS', 50)->nullable()->default('');
            $table->integer('PROFUNDIDAD')->nullable()->default(0);
            $table->string('CALIDAD', 40)->nullable()->default('');
            $table->integer('NROCLIENTEEPE')->nullable();
            $table->string('SUMINISTRO', 32)->nullable()->default('');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_meters_ud');
    }
}
