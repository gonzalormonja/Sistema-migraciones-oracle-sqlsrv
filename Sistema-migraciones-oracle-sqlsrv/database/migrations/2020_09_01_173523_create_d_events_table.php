<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('d_events', function (Blueprint $table) {
            $table->bigIncrements('Id');
            $table->integer('m_event_id')->unique('UK_m_event_id_d_events');
            $table->dateTime('Fecha_Hora')->index('IX_de_Fecha_Hora_d_events');
            $table->integer('Año')->index('IX_de_Año_d_events');
            $table->integer('Mes')->index('IX_de_Mes_d_events');
            $table->integer('Dia')->index('IX_de_Dia_d_events');
            $table->integer('Hora');
            $table->string('Cliente', 100)->index('IX_de_Cliente_d_events');
            $table->string('Ciudad', 100);
            $table->string('Punto_de_Medida', 50)->index('IX_de_Punto_de_Medida_d_events');
            $table->string('Medidor', 50)->index('IX_de_Medidor_d_events');
            $table->string('Concentrador', 50);
            $table->string('Evento_Protocolo', 100);
            $table->string('Evento_Usuario', 100);
            $table->string('Grupo_Evento', 100);
            $table->string('TARIFA', 40);
            $table->string('POTENCIA', 40);
            $table->string('ZONA', 40);
            $table->integer('FACT');
            $table->string('CHASIS', 50);
            $table->integer('PROFUNDIDAD');
            $table->string('CALIDAD', 40);
            $table->integer('NROCLIENTEEPE');
            $table->string('SUMINISTRO', 32);
            $table->unique(['Id', 'm_event_id', 'Fecha_Hora', 'Año', 'Mes', 'Dia', 'Hora', 'Cliente', 'Ciudad', 'Punto_de_Medida', 'Medidor', 'Concentrador', 'Evento_Protocolo', 'Evento_Usuario', 'Grupo_Evento', 'TARIFA', 'POTENCIA', 'ZONA', 'FACT', 'CHASIS', 'PROFUNDIDAD', 'CALIDAD', 'NROCLIENTEEPE', 'SUMINISTRO'], 'UK_d_events_d_events');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('d_events');
    }
}
