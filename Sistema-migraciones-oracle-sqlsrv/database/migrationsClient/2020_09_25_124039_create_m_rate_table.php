<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMRateTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_rate', function (Blueprint $table) {
            $table->increments('ID_rate');
            $table->string('name', 50)->nullable();
            $table->string('descr', 100)->nullable();
            $table->string('color', 50)->nullable();
            $table->float('val', 53, 0)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_rate');
    }
}
