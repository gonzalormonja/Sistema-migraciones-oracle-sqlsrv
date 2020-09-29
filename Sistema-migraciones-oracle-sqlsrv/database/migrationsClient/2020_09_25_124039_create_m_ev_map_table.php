<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMEvMapTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_ev_map', function (Blueprint $table) {
            $table->integer('ev_app_id')->primary('PK__m_ev_map__5EB5B9DA87C680F8_m_ev_map');
            $table->char('ev_std_desc', 100)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_ev_map');
    }
}
