<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateALicensesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('a_licenses', function (Blueprint $table) {
            $table->increments('id');
            $table->string('code', 8)->unique('IX_a_licenses_a_licenses');
            $table->integer('client_id');
            $table->dateTime('start_date');
            $table->dateTime('expire_date');
            $table->dateTime('consume_date')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('a_licenses');
    }
}
