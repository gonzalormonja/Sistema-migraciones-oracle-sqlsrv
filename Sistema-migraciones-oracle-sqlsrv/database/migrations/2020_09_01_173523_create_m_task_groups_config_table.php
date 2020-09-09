<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMTaskGroupsConfigTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_task_groups_config', function (Blueprint $table) {
            $table->increments('groupal_task_id');
            $table->integer('group_id');
            $table->tinyInteger('command_perfil')->nullable()->default(0);
            $table->string('command_perfil_logs', 50)->nullable()->default('');
            $table->string('command_perfil_desde', 50)->nullable();
            $table->string('command_perfil_hasta', 50)->nullable();
            $table->tinyInteger('command_facturacion')->nullable()->default(0);
            $table->string('command_facturacion_desde', 50)->nullable();
            $table->string('command_facturacion_hasta', 50)->nullable();
            $table->tinyInteger('command_facturacion_reset')->nullable();
            $table->tinyInteger('command_instantaneos')->nullable()->default(0);
            $table->tinyInteger('command_eventos')->nullable()->default(0);
            $table->string('command_eventos_desde', 50)->nullable();
            $table->string('command_eventos_hasta', 50)->nullable();
            $table->tinyInteger('command_sincronizar')->nullable()->default(0);
            $table->string('command_sincronizar_min', 10)->nullable()->default('min');
            $table->string('command_sincronizar_max', 10)->nullable()->default('max');
            $table->dateTime('start_time');
            $table->dateTime('end_time');
            $table->string('period', 50)->nullable();
            $table->integer('priority');
            $table->integer('max_retries');
            $table->integer('t_retry');
            $table->integer('max_time')->nullable();
            $table->integer('enable')->default(1);
            $table->integer('do_now')->default(0);
            $table->integer('include_slaves');
            $table->integer('task_act')->nullable();
            $table->dateTime('next_execution')->nullable();
            $table->integer('do_always')->nullable();
            $table->integer('trace_call')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_task_groups_config');
    }
}
