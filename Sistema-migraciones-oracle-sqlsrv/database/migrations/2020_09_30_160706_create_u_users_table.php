<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('u_users', function (Blueprint $table) {
            $table->string('username', 16);
            $table->string('name', 45);
            $table->string('email', 45);
            $table->string('password', 64);
            $table->integer('id_auth')->default(0);
            $table->increments('user_id');
            $table->integer('rol_id')->default(1);
            $table->integer('menu_collapse')->nullable();
            $table->string('menu_fav', 250)->nullable();
            $table->boolean('change_password')->nullable();
            $table->boolean('enable')->default(1);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('u_users');
    }
}
