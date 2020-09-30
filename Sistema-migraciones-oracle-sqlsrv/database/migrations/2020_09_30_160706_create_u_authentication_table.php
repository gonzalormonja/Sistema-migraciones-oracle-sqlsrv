<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUAuthenticationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('u_authentication', function (Blueprint $table) {
            $table->integer('id_auth')->primary('PK__u_authen__B191F5ED8C0514E2_u_authentication');
            $table->string('description', 45)->nullable();
            $table->integer('auth_type');
            $table->string('server_addr', 15)->nullable();
            $table->integer('server_port')->nullable();
            $table->string('shared_secret', 45)->nullable();
            $table->string('base_dn', 45)->nullable();
            $table->string('bind_dn', 45)->nullable();
            $table->string('pass_bind_dn', 16)->nullable();
            $table->string('root_bind_dn', 45)->nullable();
            $table->string('pass_root_bind_dn', 16)->nullable();
            $table->string('users_base_dn', 45)->nullable();
            $table->string('password_hash', 128)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('u_authentication');
    }
}
