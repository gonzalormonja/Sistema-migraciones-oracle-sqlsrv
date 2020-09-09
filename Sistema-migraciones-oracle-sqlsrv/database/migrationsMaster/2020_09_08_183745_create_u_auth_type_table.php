<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUAuthTypeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('u_auth_type', function (Blueprint $table) {
            $table->string('description', 45);
            $table->integer('auth_type_id')->primary('PK__u_auth_t__D744254974794D0A_u_auth_type');
            $table->string('auth_name', 16);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('u_auth_type');
    }
}
