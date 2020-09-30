<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRParametersScheduleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('r_parameters_schedule', function (Blueprint $table) {
            $table->integer('SCH_REPORT_ID');
            $table->integer('ID_PARAM');
            $table->string('VALOR', 300);
            $table->primary(['ID_PARAM', 'SCH_REPORT_ID'], 'PK__r_parame__DE216DF1E5AABAF9_r_parameters_schedule');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r_parameters_schedule');
    }
}
