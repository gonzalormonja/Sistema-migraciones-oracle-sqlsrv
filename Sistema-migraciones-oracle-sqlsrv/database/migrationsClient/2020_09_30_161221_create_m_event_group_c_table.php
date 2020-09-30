<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMEventGroupCTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_event_group_c', function (Blueprint $table) {
            $table->integer('id_ev_gp')->primary('PK__m_event___8B9F65DD19F4D3BB_m_event_group_c');
            $table->string('name_ev_gp', 100)->nullable();
            $table->string('descr_ev_gp', 250)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_event_group_c');
    }
}
