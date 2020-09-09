<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDCubeSavedDesignsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('d_cube_saved_designs', function (Blueprint $table) {
            $table->increments('ID');
            $table->string('main_filter', 30);
            $table->string('name', 50);
            $table->integer('owner');
            $table->text('json');
            $table->dateTime('last_updated')->useCurrent();
            $table->integer('is_public')->nullable()->default(0);
            $table->unique(['main_filter', 'name'], 'UQ_CUBE_DESIGN_NAME_d_cube_saved_designs');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('d_cube_saved_designs');
    }
}
