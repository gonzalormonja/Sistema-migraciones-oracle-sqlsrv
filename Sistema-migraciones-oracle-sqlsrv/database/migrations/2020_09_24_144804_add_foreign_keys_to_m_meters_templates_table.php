<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMMetersTemplatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_meters_templates', function (Blueprint $table) {
            $table->foreign(array('proto_id'), 'fk_m_meters_templates')->references(array('proto_id'))->on('m_app_protos')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_meters_templates', function (Blueprint $table) {
            $table->dropForeign('fk_m_meters_templates');
        });
    }
}
