<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSMenuItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('s_menu_items', function (Blueprint $table) {
            $table->integer('menu_item_id')->primary('PK_s_menu_items_s_menu_items');
            $table->string('menu_item_name', 32);
            $table->integer('menu_item_type');
            $table->string('menu_item_icono', 64);
            $table->string('menu_item_text', 24);
            $table->string('menu_item_hlink', 64);
            $table->string('menu_item_bgcolor', 20);
            $table->integer('menu_id');
            $table->string('menu_item_fcolor', 20);
            $table->string('menu_item_size', 15);
            $table->string('menu_item_route', 250)->nullable();
            $table->string('menu_item_info', 64)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('s_menu_items');
    }
}
