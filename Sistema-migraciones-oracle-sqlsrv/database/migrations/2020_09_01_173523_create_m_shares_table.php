<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMSharesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_shares', function (Blueprint $table) {
            $table->integer('share_id')->primary('PK_m_shares_m_shares');
            $table->string('ip_addr', 16);
            $table->string('share_name', 80);
            $table->integer('sched_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_shares');
    }
}
