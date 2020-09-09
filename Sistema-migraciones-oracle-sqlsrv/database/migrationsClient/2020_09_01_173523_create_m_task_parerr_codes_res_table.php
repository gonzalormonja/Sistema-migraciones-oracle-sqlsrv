<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMTaskParerrCodesResTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_task_parerr_codes_res', function (Blueprint $table) {
            $table->integer('error_cat');
            $table->integer('error_code');
            $table->integer('parcial_error');
            $table->string('descr', 500)->nullable();
            $table->string('category', 500)->nullable();
            $table->primary(['error_cat', 'error_code', 'parcial_error'], 'PK_m_task_parerr_codes_res_m_task_parerr_codes_res');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_task_parerr_codes_res');
    }
}
