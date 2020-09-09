<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_clients', function (Blueprint $table) {
            $table->foreign(array('client_id'), 'FK__m_clients__clien__114A936A')->references(array('client_id'))->on('m_lic_client')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_clients', function (Blueprint $table) {
            $table->dropForeign('FK__m_clients__clien__114A936A');
        });
    }
}
