<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_clients', function (Blueprint $table) {
            $table->integer('client_id')->primary('PK__m_client__BF21A4244A047AED_m_clients');
            $table->string('dsn_name', 32);
            $table->string('dsn_user', 32);
            $table->string('dsn_password', 32);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_clients');
    }
}
