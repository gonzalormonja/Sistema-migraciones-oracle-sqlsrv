<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAuditEstimationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_audit_estimation', function (Blueprint $table) {
            $table->increments('id');
            $table->dateTime('est_date');
            $table->string('result', 150)->nullable();
            $table->string('user_name', 80)->nullable();
            $table->string('meter_id', 32)->nullable();
            $table->string('url_log')->nullable();
            $table->integer('method')->nullable();
            $table->dateTime('closing_date')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_audit_estimation');
    }
}
