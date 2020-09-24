<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMDoneTasksResPTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_done_tasks_res_p', function (Blueprint $table) {
            $table->integer('Id');
            $table->string('meter_id', 32);
            $table->string('parcial_error', 256)->nullable();
            $table->integer('user_id')->nullable();
            $table->string('user_name', 45)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_done_tasks_res_p');
    }
}
