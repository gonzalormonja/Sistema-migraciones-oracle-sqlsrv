<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToCClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('c_clients', function (Blueprint $table) {
            $table->foreign(array('m_client_id'), 'FK__c_clients__m_cli__0F624AF8')->references(array('client_id'))->on('m_clients')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(array('m_client_id'), 'FK__c_clients__m_cli__10566F31')->references(array('client_id'))->on('m_lic_client')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('c_clients', function (Blueprint $table) {
            $table->dropForeign('FK__c_clients__m_cli__0F624AF8');
            $table->dropForeign('FK__c_clients__m_cli__10566F31');
        });
    }
}
