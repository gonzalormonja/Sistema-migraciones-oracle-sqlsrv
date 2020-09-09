<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSMenuTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('s_menu', function (Blueprint $table) {
            $table->integer('menu_id')->primary('PK_s_menu_s_menu');
            $table->string('menu_name', 32)->nullable();
            $table->string('menu_desc', 80);
            $table->boolean('menu_main')->nullable();
            $table->string('menu_icon', 50)->nullable();
            $table->string('menu_color', 50)->nullable();
            $table->string('menu_item_route', 250)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('s_menu');
    }
}
