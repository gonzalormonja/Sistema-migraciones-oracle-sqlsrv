<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRScheduleReportTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('r_schedule_report', function (Blueprint $table) {
            $table->decimal('SCH_REPORT_ID', 28, 0)->primary('PK_SCHEDULE_REPORT_r_schedule_report');
            $table->decimal('REPORTID', 28, 0);
            $table->dateTime('DATETIMENEXT')->nullable();
            $table->dateTime('DATETIME_start');
            $table->dateTime('DATETIME_end')->nullable();
            $table->string('DESTIN', 15);
            $table->smallInteger('RETRIES')->nullable();
            $table->smallInteger('RETRYTIME')->nullable();
            $table->smallInteger('FREQ')->nullable();
            $table->string('PERIOD', 30)->nullable();
            $table->string('FILETYPE', 20)->nullable();
            $table->string('FILENAME', 254)->nullable();
            $table->string('TOLIST', 1100)->nullable();
            $table->string('CCLIST', 1100)->nullable();
            $table->string('BCCLIST', 1100)->nullable();
            $table->string('SUBJ', 200)->nullable();
            $table->string('MESS', 254)->nullable();
            $table->string('FILENAME_FORMAT', 254)->nullable();
            $table->integer('STATUS')->nullable()->default(1);
            $table->string('DAY', 50)->nullable();
            $table->string('TIME', 5);
            $table->string('FILELOCATION', 254)->nullable();
            $table->string('COMAN_CRON', 500)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r_schedule_report');
    }
}
