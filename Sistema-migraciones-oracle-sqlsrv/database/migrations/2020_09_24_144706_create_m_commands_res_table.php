<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMCommandsResTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('m_commands_res', function (Blueprint $table) {
            $table->integer('command_id')->primary('PK__m_comman__F536D5DAC48B7950_m_commands_res');
            $table->string('string', 48)->nullable();
            $table->string('type', 12);
            $table->string('type_desc', 48);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_commands_res');
    }
}
