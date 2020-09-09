<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMAgentsDcAdvParametersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_agents_dc_adv_parameters', function (Blueprint $table) {
            $table->foreign(array('agent_id'), 'FK_m_agents_dc_advanced_parameters_1')->references(array('agent_id'))->on('m_agents')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_agents_dc_adv_parameters', function (Blueprint $table) {
            $table->dropForeign('FK_m_agents_dc_advanced_parameters_1');
        });
    }
}
