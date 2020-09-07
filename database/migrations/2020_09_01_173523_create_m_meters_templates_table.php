<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMMetersTemplatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_meters_templates', function (Blueprint $table) {
            $table->integer('proto_id');
            $table->string('type', 15);
            $table->string('parameter', 50);
            $table->string('value', 50)->nullable();
            $table->integer('brand_id');
            $table->primary(['proto_id', 'type', 'parameter', 'brand_id'], 'PK__m_meters__946F4FA1D34DE061_m_meters_templates');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_meters_templates');
    }
}
