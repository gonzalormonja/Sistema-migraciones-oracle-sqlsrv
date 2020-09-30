<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMBrandsCommandsResTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_brands_commands_res', function (Blueprint $table) {
            $table->foreign(array('cnc_brand_id'), 'FK_m_brands_commands_m_meters_brands_res')->references(array('cnc_brand_id'))->on('m_cnc_brands')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('command_id'), 'FK_m_brands_commands_m_commands_res')->references(array('command_id'))->on('m_commands_res')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_brands_commands_res', function (Blueprint $table) {
            $table->dropForeign('FK_m_brands_commands_m_meters_brands_res');
            $table->dropForeign('FK_m_brands_commands_m_commands_res');
        });
    }
}
