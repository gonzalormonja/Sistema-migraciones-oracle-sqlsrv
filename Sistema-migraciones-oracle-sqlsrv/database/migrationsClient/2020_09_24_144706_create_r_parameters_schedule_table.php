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
            $table->decimal('SCH_REPORT_ID', 28, 0);
            $table->decimal('ID_PARAM', 28, 0);
            $table->string('VALOR', 300);
            $table->primary(['SCH_REPORT_ID', 'ID_PARAM'], 'PK_FILTER_r_parameters_schedule');
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
