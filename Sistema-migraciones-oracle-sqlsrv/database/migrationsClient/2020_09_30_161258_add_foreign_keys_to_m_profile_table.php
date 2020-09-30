<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMProfileTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_profile', function (Blueprint $table) {
            $table->foreign(array('origin_id'), 'FK_m_profile_origin_id')->references(array('origin_id'))->on('m_origin')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('reg_descr_id'), 'FK_m_profile_1')->references(array('id'))->on('m_reg_desc_map')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_profile', function (Blueprint $table) {
            $table->dropForeign('FK_m_profile_origin_id');
            $table->dropForeign('FK_m_profile_1');
        });
    }
}
