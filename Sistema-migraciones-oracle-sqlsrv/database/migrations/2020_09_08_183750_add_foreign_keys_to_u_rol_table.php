<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToURolTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('u_rol', function (Blueprint $table) {
            $table->foreign(array('client_id'), 'FK_u_rol_1')->references(array('client_id'))->on('c_clients')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('u_rol', function (Blueprint $table) {
            $table->dropForeign('FK_u_rol_1');
        });
    }
}
