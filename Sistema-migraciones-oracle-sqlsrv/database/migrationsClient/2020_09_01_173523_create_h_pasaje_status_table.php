<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHPasajeStatusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('h_pasaje_status', function (Blueprint $table) {
            $table->increments('status_id');
            $table->dateTime('datetime_ult_reg')->nullable();
            $table->dateTime('datetime_inicio')->nullable();
            $table->string('tablaActual', 50)->nullable();
            $table->integer('cantRegistrosTotal')->nullable()->default(-1);
            $table->integer('cantRegistros')->nullable()->default(0);
            $table->string('status', 50);
            $table->string('type_exec', 50)->nullable();
            $table->integer('pasaje_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->dateTime('dateTimeFirst')->nullable();
            $table->dateTime('datetimeLast')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('h_pasaje_status');
    }
}
