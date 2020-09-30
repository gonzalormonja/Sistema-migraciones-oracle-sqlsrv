<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToRReportParametersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('r_report_parameters', function (Blueprint $table) {
            $table->foreign(array('ID_PARAM'), 'FK_report_parameters_1')->references(array('ID_PARAM'))->on('r_parameters')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('REPORTID'), 'FK_report_parameters_2')->references(array('REPORTID'))->on('r_report')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('r_report_parameters', function (Blueprint $table) {
            $table->dropForeign('FK_report_parameters_1');
            $table->dropForeign('FK_report_parameters_2');
        });
    }
}
