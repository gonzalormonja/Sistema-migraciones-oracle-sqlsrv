<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMEventListCTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_event_list_c', function (Blueprint $table) {
            $table->integer('groupid');
            $table->integer('id_ev');
            $table->string('name', 100)->nullable();
            $table->string('description', 250)->nullable();
            $table->primary(['id_ev', 'groupid'], 'PK__m_event___483B8E54968D9322_m_event_list_c');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_event_list_c');
    }
}
