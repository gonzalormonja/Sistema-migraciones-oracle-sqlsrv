<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMAgentsParametersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_agents_parameters', function (Blueprint $table) {
            $table->foreign(array('agent_id'), 'FK_m_agents_parameters_1')->references(array('agent_id'))->on('m_agents')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('sched_id'), 'FK_m_agents_parameters_2')->references(array('sched_id'))->on('m_schedulers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('share_id'), 'FK_m_agents_parameters_3')->references(array('share_id'))->on('m_shares')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_agents_parameters', function (Blueprint $table) {
            $table->dropForeign('FK_m_agents_parameters_1');
            $table->dropForeign('FK_m_agents_parameters_2');
            $table->dropForeign('FK_m_agents_parameters_3');
        });
    }
}
