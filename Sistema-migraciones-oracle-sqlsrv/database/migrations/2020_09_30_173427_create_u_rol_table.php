<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateURolTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('u_rol', function (Blueprint $table) {
            $table->string('rol_name', 16);
            $table->string('rol_desc', 128)->nullable();
            $table->integer('rol_enable');
            $table->integer('client_id');
            $table->increments('rol_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('u_rol');
    }
}
