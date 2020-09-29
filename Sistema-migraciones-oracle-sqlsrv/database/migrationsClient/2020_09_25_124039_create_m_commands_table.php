<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMCommandsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_commands', function (Blueprint $table) {
            $table->integer('command_id')->primary('PK__m_comman__F536D5DAFBBED01F_m_commands');
            $table->string('string', 48);
            $table->integer('type');
            $table->integer('log')->default(0);
            $table->integer('reg_type')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_commands');
    }
}
