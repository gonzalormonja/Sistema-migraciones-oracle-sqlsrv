<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToUUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('u_users', function (Blueprint $table) {
            $table->foreign(array('id_auth'), 'fk_u_users_1')->references(array('id_auth'))->on('u_authentication')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('rol_id'), 'FK_u_users_2')->references(array('rol_id'))->on('u_rol')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('u_users', function (Blueprint $table) {
            $table->dropForeign('fk_u_users_1');
            $table->dropForeign('FK_u_users_2');
        });
    }
}
