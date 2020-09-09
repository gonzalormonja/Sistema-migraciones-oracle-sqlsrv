<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMTaskErrCodesResTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_task_err_codes_res', function (Blueprint $table) {
            $table->integer('error_code')->primary('PK_m_task_err_codes_res_m_task_err_codes_res');
            $table->string('error_desc', 500)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_task_err_codes_res');
    }
}
