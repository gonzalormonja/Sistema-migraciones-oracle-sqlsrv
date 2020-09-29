<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_customers', function (Blueprint $table) {
            $table->string('customer_id', 50)->primary('PK__c_custom__CD65CB8566E3A16B_c_customers');
            $table->string('nombre', 48);
            $table->string('cod_identificacion', 50)->nullable();
            $table->string('cuit', 11)->nullable();
            $table->string('address1', 48);
            $table->string('address2', 48)->nullable();
            $table->string('address3', 48)->nullable();
            $table->string('contact_name', 48)->nullable();
            $table->string('contact_mail', 48)->nullable();
            $table->string('contact_phone', 48)->nullable();
            $table->integer('id_city');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('c_customers');
    }
}
