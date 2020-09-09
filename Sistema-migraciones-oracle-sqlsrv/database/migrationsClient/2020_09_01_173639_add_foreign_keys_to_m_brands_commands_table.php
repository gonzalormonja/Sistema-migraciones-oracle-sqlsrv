<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMBrandsCommandsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_brands_commands', function (Blueprint $table) {
            $table->foreign(array('command_id'), 'FK_m_brands_commands_m_commands')->references(array('command_id'))->on('m_commands')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('brand_id'), 'FK_m_brands_commands_m_meters_brands')->references(array('brand_id'))->on('m_meters_brands')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_brands_commands', function (Blueprint $table) {
            $table->dropForeign('FK_m_brands_commands_m_commands');
            $table->dropForeign('FK_m_brands_commands_m_meters_brands');
        });
    }
}
