<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMEvMapCncTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_ev_map_cnc', function (Blueprint $table) {
            $table->integer('ev_app_cnc_id')->primary('PK__m_ev_map__5469EE9EF0FC3F8E_m_ev_map_cnc');
            $table->char('ev_std_cnc_desc', 100)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_ev_map_cnc');
    }
}
