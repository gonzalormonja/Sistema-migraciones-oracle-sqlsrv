<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToRScheduleReportTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('r_schedule_report', function (Blueprint $table) {
            $table->foreign(array('REPORTID'), 'FK_report_schedule_1')->references(array('REPORTID'))->on('r_report')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('r_schedule_report', function (Blueprint $table) {
            $table->dropForeign('FK_report_schedule_1');
        });
    }
}
