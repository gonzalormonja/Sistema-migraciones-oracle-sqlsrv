<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToUAuthenticationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('u_authentication', function (Blueprint $table) {
            $table->foreign(array('auth_type'), 'fk_u_authentication_1')->references(array('auth_type_id'))->on('u_auth_type')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('u_authentication', function (Blueprint $table) {
            $table->dropForeign('fk_u_authentication_1');
        });
    }
}
