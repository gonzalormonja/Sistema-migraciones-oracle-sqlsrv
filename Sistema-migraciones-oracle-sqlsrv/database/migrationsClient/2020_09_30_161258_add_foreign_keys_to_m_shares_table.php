<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMSharesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('m_shares', function (Blueprint $table) {
            $table->foreign(array('sched_id'), 'FK_m_shares_2')->references(array('sched_id'))->on('m_schedulers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('m_shares', function (Blueprint $table) {
            $table->dropForeign('FK_m_shares_2');
        });
    }
}
