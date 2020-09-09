<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePEtlTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('p_etl', function (Blueprint $table) {
            $table->dateTime('datetime_up')->nullable();
            $table->integer('execute_etl')->nullable();
            $table->dateTime('prof_last_read_old')->nullable();
            $table->dateTime('prof_last_read_new')->nullable();
            $table->dateTime('eob_last_read_old')->nullable();
            $table->dateTime('eob_last_read_new')->nullable();
            $table->string('meter_id', 100)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('p_etl');
    }
}
