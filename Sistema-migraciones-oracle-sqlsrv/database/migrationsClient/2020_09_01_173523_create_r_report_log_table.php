<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRReportLogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('r_report_log', function (Blueprint $table) {
            $table->increments('ID');
            $table->integer('sch_report_id');
            $table->integer('reportid');
            $table->dateTime('r_datetime');
            $table->integer('user_id');
            $table->string('destin', 15)->nullable();
            $table->string('filename', 254)->nullable();
            $table->string('filetype', 20)->nullable();
            $table->string('Filelocation', 254)->nullable();
            $table->string('Tolist', 1100)->nullable();
            $table->string('Cclist', 1100)->nullable();
            $table->string('BCclist', 1100)->nullable();
            $table->string('Subj', 200)->nullable();
            $table->string('Mess', 254)->nullable();
            $table->string('comand_cron', 500);
            $table->string('details', 254)->nullable();
            $table->integer('error_code');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r_report_log');
    }
}
