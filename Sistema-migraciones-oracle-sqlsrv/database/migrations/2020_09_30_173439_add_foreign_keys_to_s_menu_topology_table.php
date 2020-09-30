<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToSMenuTopologyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('s_menu_topology', function (Blueprint $table) {
            $table->foreign(array('menu_id'), 'FK_s_menu_topology_1')->references(array('menu_id'))->on('s_menu')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('menu_item_id'), 'FK_s_menu_topology_2')->references(array('menu_item_id'))->on('s_menu_items')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('s_menu_topology', function (Blueprint $table) {
            $table->dropForeign('FK_s_menu_topology_1');
            $table->dropForeign('FK_s_menu_topology_2');
        });
    }
}
