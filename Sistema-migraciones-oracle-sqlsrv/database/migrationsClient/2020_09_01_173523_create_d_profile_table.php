<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDProfileTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('d_profile', function (Blueprint $table) {
            $table->bigIncrements('Id');
            $table->bigInteger('m_profile_id')->unique('UK_m_profile_id_d_profile');
            $table->dateTime('Fecha_Hora')->index('IX_dp_Fecha_Hora_d_profile');
            $table->integer('Año')->index('IX_dp_Año_d_profile');
            $table->integer('Mes')->index('IX_dp_Mes_d_profile');
            $table->integer('Dia')->index('IX_dp_Dia_d_profile');
            $table->integer('Hora');
            $table->integer('Intervalo');
            $table->string('Cliente', 100)->index('IX_dp_Cliente_d_profile');
            $table->string('Ciudad', 100);
            $table->string('Punto_de_Medida', 50)->index('IX_dp_Punto_de_Medida_d_profile');
            $table->string('Medidor', 50)->index('IX_dp_Medidor_d_profile');
            $table->integer('log');
            $table->string('Canal_Protocolo', 100);
            $table->string('Canal_Usuario', 100);
            $table->string('Unidad_Protocolo', 100);
            $table->string('Unidad_Usuario', 10);
            $table->float('Valor', 53, 0);
            $table->float('Valor_Demanda', 53, 0);
            $table->float('Valor_Editado', 53, 0);
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
            $table->unique(['Id', 'm_profile_id', 'Fecha_Hora', 'Año', 'Mes', 'Dia', 'Hora', 'Intervalo', 'Cliente', 'Ciudad', 'Punto_de_Medida', 'Medidor', 'log', 'Canal_Protocolo', 'Canal_Usuario', 'Unidad_Protocolo', 'Unidad_Usuario', 'Valor', 'Valor_Demanda', 'Valor_Editado', 'Valor_Factor', 'TARIFA', 'POTENCIA', 'ZONA', 'FACT', 'CHASIS', 'PROFUNDIDAD', 'CALIDAD', 'NROCLIENTEEPE', 'SUMINISTRO'], 'UK_d_profile_d_profile');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('d_profile');
    }
}
