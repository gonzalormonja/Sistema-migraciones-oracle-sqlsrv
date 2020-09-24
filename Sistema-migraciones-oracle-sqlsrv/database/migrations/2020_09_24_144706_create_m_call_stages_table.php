<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMCallStagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_call_stages', function (Blueprint $table) {
            $table->integer('stage_id')->primary('PK_m_call_stages_m_call_stages');
            $table->string('stage_name', 20);
            $table->string('stage_descr', 80);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_call_stages');
    }
}
