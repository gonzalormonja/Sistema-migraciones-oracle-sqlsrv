<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSAuditProgramsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('s_audit_programs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 50)->nullable()->unique('UQ_S_AUDIT_PROGRAMS_NAME_s_audit_programs');
            $table->boolean('enable')->default(1);
            $table->date('active_date_since')->nullable();
            $table->date('active_date_until')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('s_audit_programs');
    }
}
