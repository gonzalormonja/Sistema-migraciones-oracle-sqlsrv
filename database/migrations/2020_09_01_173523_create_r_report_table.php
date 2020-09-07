<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRReportTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('r_report', function (Blueprint $table) {
            $table->decimal('REPORTID', 28, 0)->primary('PK_REPORT_r_report');
            $table->string('DESCRIPTION', 150);
            $table->string('REPORT', 200);
            $table->string('IMAGE', 75)->nullable();
            $table->string('dir_report', 200)->nullable();
            $table->string('type_output', 200)->nullable();
            $table->integer('type_exe')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r_report');
    }
}
