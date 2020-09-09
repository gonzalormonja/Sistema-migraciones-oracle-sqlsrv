<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHServerHistoricalTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('h_server_historical', function (Blueprint $table) {
            $table->increments('server_id');
            $table->string('server', 100);
            $table->string('SID', 100);
            $table->string('engine', 50);
            $table->string('BD', 100);
            $table->string('user_name', 100);
            $table->string('password');
            $table->integer('enabled')->nullable();
            $table->integer('port')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('h_server_historical');
    }
}
