<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateViewLastreadMeters extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $file = ".env";
        $isSqlServer=true;
        $fp = fopen($file,"r+") or die("ocurrio un error");
        while ($linea = fgets($fp)) {
            $cadena_buscada = "oracle";
            $pos = strpos($linea,$cadena_buscada);
            if($pos!==false){
                $isSqlServer=false;
            }
        }
        if($isSqlServer){
            $sql="
            create view [dbo].[lastread_meters]
            as
            select a.meter_id, max(a.prof_lr_sort_0) as prof_lr_sort_0, max(a.prof_lr_sort_1) as prof_lr_sort_1, max(a.prof_lr_sort_2) as prof_lr_sort_2, max(a.eob_lr_sort) as eob_lr_sort, max(a.reg_lr_sort) as reg_lr_sort, max(a.ev_last_read) as ev_last_read
            from
            (select	meter_id,
                        CASE WHEN (m_meters_lastread.reg_type = 4 OR m_meters_lastread.reg_type = 42) AND m_meters_lastread.log = 0 THEN m_meters_lastread.last_read END AS 'prof_lr_sort_0', 
                        CASE WHEN (m_meters_lastread.reg_type = 4 OR m_meters_lastread.reg_type = 43) AND m_meters_lastread.log = 1 THEN m_meters_lastread.last_read END AS 'prof_lr_sort_1', 
                        CASE WHEN m_meters_lastread.reg_type = 4 AND m_meters_lastread.log = 2 THEN m_meters_lastread.last_read END AS 'prof_lr_sort_2', 
                        CASE WHEN (m_meters_lastread.reg_type = 1 OR m_meters_lastread.reg_type = 14) THEN m_meters_lastread.last_read END AS 'eob_lr_sort',
                        CASE WHEN (m_meters_lastread.reg_type = 2 OR m_meters_lastread.reg_type = 21) THEN m_meters_lastread.last_read END AS 'reg_lr_sort', 
                        CASE WHEN (m_meters_lastread.reg_type = 3 OR m_meters_lastread.reg_type = 39) THEN  m_meters_lastread.last_read END AS 'ev_last_read'
                    from m_meters_lastread) a
            group by a.meter_id
            ";
            DB::unprepared($sql);
        }else{
            $sql=
            "
            CREATE VIEW lastread_meters
            AS
                SELECT 
                    a.meter_id, 
                    MAX(a.prof_lr_sort_0) AS prof_lr_sort_0, 
                    MAX(a.prof_lr_sort_1) AS prof_lr_sort_1, 
                    MAX(a.prof_lr_sort_2) AS prof_lr_sort_2, 
                    MAX(a.eob_lr_sort) AS eob_lr_sort, 
                    MAX(a.reg_lr_sort) AS reg_lr_sort, 
                    MAX(a.ev_last_read) AS ev_last_read
                FROM
                    (SELECT	meter_id,
                        CASE WHEN (m_meters_lastread.reg_type = 4 OR m_meters_lastread.reg_type = 42) AND m_meters_lastread.log = 0 THEN m_meters_lastread.last_read END prof_lr_sort_0, 
                        CASE WHEN (m_meters_lastread.reg_type = 4 OR m_meters_lastread.reg_type = 43) AND m_meters_lastread.log = 1 THEN m_meters_lastread.last_read END AS prof_lr_sort_1, 
                        CASE WHEN m_meters_lastread.reg_type = 4 AND m_meters_lastread.log = 2 THEN m_meters_lastread.last_read END AS prof_lr_sort_2, 
                        CASE WHEN (m_meters_lastread.reg_type = 1 OR m_meters_lastread.reg_type = 14) THEN m_meters_lastread.last_read END AS eob_lr_sort,
                        CASE WHEN (m_meters_lastread.reg_type = 2 OR m_meters_lastread.reg_type = 21) THEN m_meters_lastread.last_read END AS reg_lr_sort, 
                        CASE WHEN (m_meters_lastread.reg_type = 3 OR m_meters_lastread.reg_type = 39) THEN  m_meters_lastread.last_read END AS ev_last_read
                    FROM m_meters_lastread) a
            GROUP BY a.meter_id
            ";
            DB::unprepared($sql);
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('m_link_abb_data');
    }
}
