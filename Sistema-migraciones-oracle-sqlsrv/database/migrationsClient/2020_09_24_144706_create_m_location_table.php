<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMLocationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_location', function (Blueprint $table) {
            $table->string('id_meter_point', 45)->primary('PK_m_location_m_location');
            $table->string('name_meter_point', 50)->nullable();
            $table->integer('virtual')->default(0);
            $table->string('address1', 127);
            $table->string('address2', 127)->nullable();
            $table->string('address3', 127)->nullable();
            $table->float('latitude', 53, 0)->nullable();
            $table->float('longitude', 53, 0)->nullable();
            $table->integer('group_id')->default(0);
            $table->string('customer_id', 50)->nullable();
            $table->string('meter_id', 32)->nullable();
            $table->dateTime('active_date')->nullable();
            $table->string('description', 85)->nullable();
            $table->integer('id_city');
            $table->string('comments', 500)->nullable();
            $table->float('TV', 53, 0)->default(1);
            $table->float('TI', 53, 0)->default(1);
            $table->integer('gen_prn')->nullable();
            $table->index(['group_id', 'customer_id', 'meter_id'], 'idx_m_location_customer_id_m_location');
            $table->index(['customer_id', 'group_id', 'meter_id'], 'idx_m_location_group_customer_m_location');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_location');
    }
}
