<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMDialersDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_dialers_data', function (Blueprint $table) {
            $table->integer('dialer_id');
            $table->integer('line');
            $table->string('send', 32)->nullable();
            $table->string('receive', 32)->nullable();
            $table->integer('timeout')->default(0);
            $table->integer('retries')->default(1);
            $table->integer('line_ok');
            $table->integer('line_error');
            $table->unique(['dialer_id', 'line'], 'IX_m_dialers_data_m_dialers_data');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_dialers_data');
    }
}
