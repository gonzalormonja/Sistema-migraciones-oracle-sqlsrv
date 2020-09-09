<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMSchedulersTasksResTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_schedulers_tasks_res ', function (Blueprint $table) {
            $table->increments('task_id')->comment('Identificador autoincremental generado por la base');
            $table->integer('task')->comment('Identificador que la base le asigna a la tarea cuando la misma es insertada en la m_config_tasks_res. Notar que cada instancia de esta tarea que se inserte en la m_config_tasks_res tendra este valor diferente.');
            $table->dateTime('next_execution')->comment('Fecha de la proxima ejecucion de esta tarea. Como ejecucion se entiende que cuando llegue esta fecha, se debe insertar una tarea en la m_config_tasks_res');
            $table->dateTime('start_time')->nullable()->comment('Si la fecha actual es anterior a esta, entonces está entrada no se tiene que  analizar.');
            $table->dateTime('end_time')->nullable()->comment('Si la fecha actual es posterior a esta, entonces está entrada no se debe analizar.');
            $table->string('period', 50)->comment('Este campo contiene la codificación de la periodicidad.');
            $table->string('req_id', 3)->comment('Identificador del request que se desea (S01, S02, ...)');
            $table->string('cnc_id', 32)->comment('Identificador del Concentrador asociado a la petición.');
            $table->string('req_param', 2048)->comment('Parámetros del request.');
            $table->integer('priority')->comment('Prioridad que debe asignarle el concentrador a la request.');
            $table->integer('max_time')->nullable()->comment('Tiempo maximo permitido para que la tarea se ejecute.');
            $table->integer('resp_mode')->comment('Modo de actualización del estado de la tarea por medidor en la m_active_tasks_res.');
            $table->integer('enable')->nullable()->comment('La tarea se analiza si este campo esta en 1, sino se ignora.');
            $table->integer('user_id')->comment('Identificador del usuario que solicito la tarea.');
            $table->string('user_name', 45)->nullable()->comment('Nombre del usuario que solicitó la tarea.');
            $table->integer('do_always')->nullable()->default(0);
            $table->integer('task_do')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_schedulers_tasks_res ');
    }
}
