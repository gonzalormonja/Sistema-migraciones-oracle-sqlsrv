<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMEventListTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_event_list', function (Blueprint $table) {
            $table->integer('groupid');
            $table->integer('id_ev');
            $table->string('name', 100)->nullable();
            $table->string('description', 250)->nullable();
            $table->integer('subgroup');
            $table->primary(['id_ev', 'groupid', 'subgroup'], 'PK__m_event___CFAD22BDFC24EE53_m_event_list');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_event_list');
    }
}
