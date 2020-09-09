<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMBrandsCommandsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_brands_commands', function (Blueprint $table) {
            $table->integer('command_id');
            $table->integer('brand_id');
            $table->primary(['command_id', 'brand_id'], 'PK__m_brands__90D37D38E729056D_m_brands_commands');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_brands_commands');
    }
}
