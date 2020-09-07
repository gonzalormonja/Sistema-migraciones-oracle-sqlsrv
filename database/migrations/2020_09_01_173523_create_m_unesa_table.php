<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMUnesaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_unesa', function (Blueprint $table) {
            $table->string('brand_unesa', 32);
            $table->string('model_unesa', 32);
            $table->string('brand', 32);
            $table->string('model', 32);
            $table->primary(['brand_unesa', 'model_unesa'], 'pk_m_unesa_m_unesa');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_unesa');
    }
}
