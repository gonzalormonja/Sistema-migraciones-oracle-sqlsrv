<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRParametersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('r_parameters', function (Blueprint $table) {
            $table->decimal('ID_PARAM', 28, 0)->primary('PK_PARAMETERS_r_parameters');
            $table->string('PARAMETER', 150);
            $table->string('TIPO_COMPONENTE', 150);
            $table->text('CONSULTA');
            $table->string('DESCR', 50)->nullable();
            $table->integer('PAR_REQUIRED');
            $table->string('JS', 2000)->nullable();
            $table->string('ORI_DB', 3)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r_parameters');
    }
}
