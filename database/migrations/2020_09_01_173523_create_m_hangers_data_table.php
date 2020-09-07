<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMHangersDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_hangers_data', function (Blueprint $table) {
            $table->integer('hanger_id');
            $table->integer('line');
            $table->string('send', 32)->nullable();
            $table->integer('timeout');
            $table->integer('retries');
            $table->integer('line_ok');
            $table->integer('line_error');
            $table->string('receive', 32)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_hangers_data');
    }
}
