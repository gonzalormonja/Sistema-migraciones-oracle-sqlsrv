<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSAuditTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('s_audit', function (Blueprint $table) {
            $table->increments('id');
            $table->dateTime('audit_date');
            $table->integer('type_obj');
            $table->string('Id_obj', 50);
            $table->integer('action');
            $table->string('module', 50)->nullable();
            $table->integer('user_id');
            $table->string('user_name', 45);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('s_audit');
    }
}
