<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMCncBrandsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_cnc_brands', function (Blueprint $table) {
            $table->integer('cnc_brand_id')->primary('PK__m_cnc_br__AA55DBC403E3B500_m_cnc_brands');
            $table->string('cnc_brand', 32);
            $table->string('cnc_model', 32);
            $table->string('cnc_version', 32)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_cnc_brands');
    }
}
