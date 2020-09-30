<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_clients', function (Blueprint $table) {
            $table->integer('client_id')->unique('id_cliente_UNIQUE_c_clients');
            $table->string('c_name', 45)->unique('razon_social_UNIQUE_c_clients');
            $table->string('address', 45);
            $table->string('city', 45);
            $table->string('postal_code', 8);
            $table->string('state', 24);
            $table->string('country', 24);
            $table->string('contact_name', 45);
            $table->string('contact_mail', 45);
            $table->string('contact_phone', 16);
            $table->string('client_code', 128);
            $table->integer('client_enable')->default(1);
            $table->string('DB_type', 25)->nullable();
            $table->string('DB_server', 50)->nullable();
            $table->string('DB_user', 25)->nullable();
            $table->string('DB_pass', 25)->nullable();
            $table->string('DB_name', 25)->nullable();
            $table->integer('DB_port')->nullable();
            $table->integer('m_client_id')->nullable();
            $table->string('DB_env', 50)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('c_clients');
    }
}
