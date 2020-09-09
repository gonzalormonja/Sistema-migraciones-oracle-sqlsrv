<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDRegisterEOBTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('d_registerEOB', function (Blueprint $table) {
            $table->bigIncrements('Id');
            $table->integer('m_register_id')->unique('UK_m_registerEOB_id_d_registerEOB');
            $table->dateTime('Fecha_Hora')->index('IX_de_Fecha_Hora_d_registerEOB');
            $table->integer('Año')->index('IX_de_Año_d_registerEOB');
            $table->integer('Mes')->index('IX_de_Mes_d_registerEOB');
            $table->integer('Dia')->index('IX_de_Dia_d_registerEOB');
            $table->integer('Hora');
            $table->string('Cliente', 100)->index('IX_de_Cliente_d_registerEOB');
            $table->string('Ciudad', 100);
            $table->string('Punto_de_Medida', 50)->index('IX_de_Punto_de_Medida_d_registerEOB');
            $table->string('Medidor', 50)->index('IX_de_Medidor_d_registerEOB');
            $table->string('Registro_Protocolo', 100);
            $table->string('Registro_Usuario', 100);
            $table->string('Unidad_Protocolo', 100);
            $table->string('Unidad_Usuario', 10);
            $table->float('Valor', 53, 0);
            $table->float('Valor_Factor', 53, 0);
            $table->string('TARIFA', 40);
            $table->string('POTENCIA', 40);
            $table->string('ZONA', 40);
            $table->integer('FACT');
            $table->string('CHASIS', 50);
            $table->integer('PROFUNDIDAD');
            $table->string('CALIDAD', 40);
            $table->integer('NROCLIENTEEPE');
            $table->string('SUMINISTRO', 32);
            $table->unique(['Id', 'm_register_id', 'Fecha_Hora', 'Año', 'Mes', 'Dia', 'Hora', 'Cliente', 'Ciudad', 'Punto_de_Medida', 'Medidor', 'Registro_Protocolo', 'Registro_Usuario', 'Unidad_Protocolo', 'Unidad_Usuario', 'Valor', 'Valor_Factor', 'TARIFA', 'POTENCIA', 'ZONA', 'FACT', 'CHASIS', 'PROFUNDIDAD', 'CALIDAD', 'NROCLIENTEEPE', 'SUMINISTRO'], 'UK_d_registerEOB_d_registerEOB');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('d_registerEOB');
    }
}
