<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMBrandsCommandsResTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_brands_commands_res', function (Blueprint $table) {
            $table->integer('command_id');
            $table->integer('cnc_brand_id');
            $table->primary(['command_id', 'cnc_brand_id'], 'PK__m_brands__AF93886683CC8030_m_brands_commands_res');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_brands_commands_res');
    }
}
