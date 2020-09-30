<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMLicClientTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_lic_client', function (Blueprint $table) {
            $table->integer('client_id')->primary('PK__m_lic_cl__BF21A42410737BAB_m_lic_client');
            $table->char('license_code', 24)->nullable();
            $table->integer('active')->nullable();
            $table->string('lstring', -1)->nullable();
            $table->integer('nmdc')->nullable();
            $table->integer('res_count')->nullable();
            $table->integer('res_i_count')->nullable();
            $table->integer('ci_count')->nullable();
            $table->integer('ci_i_count')->nullable();
            $table->string('ips', 5120)->nullable();
            $table->dateTime('start_date')->nullable();
            $table->dateTime('end_date')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_lic_client');
    }
}
