<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAuditImportTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_audit_import', function (Blueprint $table) {
            $table->increments('id');
            $table->dateTime('fecha');
            $table->string('estado', 150)->nullable();
            $table->string('usuario', 80)->nullable();
            $table->string('meter_id', 32)->nullable();
            $table->string('url_log')->nullable();
            $table->dateTime('start_dates')->nullable();
            $table->dateTime('end_dates')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_audit_import');
    }
}
