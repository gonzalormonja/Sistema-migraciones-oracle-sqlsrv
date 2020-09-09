<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMEventGroupTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_event_group', function (Blueprint $table) {
            $table->integer('id_ev_gp');
            $table->string('name_ev_gp', 100)->nullable();
            $table->string('descr_ev_gp', 250)->nullable();
            $table->integer('subgroup');
            $table->primary(['id_ev_gp', 'subgroup'], 'PK__m_event___F2F5AB4536028192_m_event_group');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_event_group');
    }
}
