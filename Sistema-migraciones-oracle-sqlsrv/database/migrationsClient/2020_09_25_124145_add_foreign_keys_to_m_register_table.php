<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMRegisterTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_register', function (Blueprint $table) {
            $table->foreign(array('reg_descr_id'), 'FK_m_register_1')->references(array('id'))->on('m_reg_desc_map')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_register', function (Blueprint $table) {
            $table->dropForeign('FK_m_register_1');
        });
    }
}
