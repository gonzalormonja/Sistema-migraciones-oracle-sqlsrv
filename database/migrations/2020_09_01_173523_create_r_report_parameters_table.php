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
            $table->decimal('ID_PARAM', 28, 0);
            $table->decimal('REPORTID', 28, 0);
            $table->integer('ORDEN')->nullable();
            $table->primary(['ID_PARAM', 'REPORTID'], 'PK_REPORT_PARAMETERS_r_report_parameters');
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
