<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToSRolMenuTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('s_rol_menu', function (Blueprint $table) {
            $table->foreign(array('menu_item_id'), 'FK_s_rol_menu_2')->references(array('menu_item_id'))->on('s_menu_items')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('rol_id'), 'FK_s_rol_menu_1')->references(array('rol_id'))->on('u_rol')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('s_rol_menu', function (Blueprint $table) {
            $table->dropForeign('FK_s_rol_menu_2');
            $table->dropForeign('FK_s_rol_menu_1');
        });
    }
}
