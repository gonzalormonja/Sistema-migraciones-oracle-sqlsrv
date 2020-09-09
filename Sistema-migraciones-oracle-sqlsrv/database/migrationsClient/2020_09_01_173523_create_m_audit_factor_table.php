<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMAuditFactorTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_audit_factor', function (Blueprint $table) {
            $table->dateTime('k_datetime');
            $table->string('id_meter_point')->nullable();
            $table->string('meter_id', 45);
            $table->integer('reg_descr_id');
            $table->dateTime('i_datetime');
            $table->dateTime('f_datetime');
            $table->float('TIa', 53, 0);
            $table->float('TVa', 53, 0);
            $table->float('TPa', 53, 0);
            $table->float('TUa', 53, 0);
            $table->float('FactorA', 53, 0);
            $table->float('TIn', 53, 0);
            $table->float('TVn', 53, 0);
            $table->float('TPn', 53, 0);
            $table->float('Tun', 53, 0);
            $table->float('FactorN', 53, 0);
            $table->integer('Customer_id');
            $table->string('C_name', 48);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_audit_factor');
    }
}
