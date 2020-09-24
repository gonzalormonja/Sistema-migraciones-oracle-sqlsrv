<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMRegDescMapTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_reg_desc_map', function (Blueprint $table) {
            $table->foreign(array('app_id'), 'FK_m_reg_desc_map_2')->references(array('prof_app_id'))->on('m_prof_map')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_reg_desc_map', function (Blueprint $table) {
            $table->dropForeign('FK_m_reg_desc_map_2');
        });
    }
}
