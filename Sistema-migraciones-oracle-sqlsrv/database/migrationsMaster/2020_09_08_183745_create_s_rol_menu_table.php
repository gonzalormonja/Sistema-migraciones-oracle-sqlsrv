<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSRolMenuTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('s_rol_menu', function (Blueprint $table) {
            $table->integer('menu_item_id');
            $table->integer('item_visible');
            $table->integer('item_permission');
            $table->integer('rol_id');
            $table->integer('permission')->default(0);
            $table->primary(['menu_item_id', 'rol_id'], 'PK_s_rol_menu_s_rol_menu');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('s_rol_menu');
    }
}
