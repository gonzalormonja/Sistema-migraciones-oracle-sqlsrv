<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMEventListCncCTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_event_list_cnc_c', function (Blueprint $table) {
            $table->integer('groupid_cnc');
            $table->integer('id_ev_cnc');
            $table->string('name_cnc', 100)->nullable();
            $table->string('description', 250)->nullable();
            $table->primary(['id_ev_cnc', 'groupid_cnc'], 'PK__m_event___36886F789A7202E3_m_event_list_cnc_c');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_event_list_cnc_c');
    }
}
