<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToRParametersScheduleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('r_parameters_schedule', function (Blueprint $table) {
            $table->foreign(array('ID_PARAM'), 'FK_r_parameters_schedule_1')->references(array('ID_PARAM'))->on('r_parameters')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('SCH_REPORT_ID'), 'FK_r_parameters_schedule_2')->references(array('SCH_REPORT_ID'))->on('r_schedule_report')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('r_parameters_schedule', function (Blueprint $table) {
            $table->dropForeign('FK_r_parameters_schedule_1');
            $table->dropForeign('FK_r_parameters_schedule_2');
        });
    }
}
