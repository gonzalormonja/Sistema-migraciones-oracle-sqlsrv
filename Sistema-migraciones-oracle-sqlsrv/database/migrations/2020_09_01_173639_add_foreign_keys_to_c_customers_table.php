<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToCCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('c_customers', function (Blueprint $table) {
            $table->foreign(array('id_city'), 'FK_c_customers')->references(array('id'))->on('c_city')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('c_customers', function (Blueprint $table) {
            $table->dropForeign('FK_c_customers');
        });
    }
}
