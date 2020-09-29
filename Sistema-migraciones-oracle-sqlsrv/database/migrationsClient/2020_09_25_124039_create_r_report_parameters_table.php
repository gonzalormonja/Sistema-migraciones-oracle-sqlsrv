<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRReportParametersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('r_report_parameters', function (Blueprint $table) {
            $table->integer('ID_PARAM');
            $table->integer('REPORTID');
            $table->integer('ORDEN')->nullable();
            $table->primary(['ID_PARAM', 'REPORTID'], 'PK__r_report__1690F7E15D512947_r_report_parameters');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r_report_parameters');
    }
}
