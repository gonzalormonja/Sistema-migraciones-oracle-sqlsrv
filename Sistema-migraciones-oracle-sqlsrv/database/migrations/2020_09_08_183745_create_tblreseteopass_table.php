<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblreseteopassTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblreseteopass', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_usuario');
            $table->string('username', 50);
            $table->string('token', 64);
            $table->dateTime('creado');
            $table->primary(['id', 'id_usuario'], 'PK_tblreseteopass_tblreseteopass');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tblreseteopass');
    }
}
