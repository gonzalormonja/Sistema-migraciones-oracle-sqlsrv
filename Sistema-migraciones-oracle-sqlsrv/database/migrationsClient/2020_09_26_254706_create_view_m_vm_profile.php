<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateViewMVmProfile extends Migration
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
            $sql='
            CREATE view [dbo].[m_vm_profile]  as
            SELECT
            a.vm_meter_id, a.vm_channel_id,a.meter_t0, a.meter_tf, a.local_t0, a.local_tf, 
            sum(a.qualifier) as qualifier, sum(a.val*a.multiplier) as val,sum(a.val_demand*a.multiplier) as val_demand, 
            sum(a.val_edit*a.multiplier) as val_edit, sum(a.val_factor*a.multiplier) as val_factor, case when a.report=-1 then 2 else a.report end as "report",
            sum(cast(a.reg_quality as int)) as reg_quality, count(a.meter_t0) as  IntAct, a.IntEsp
            FROM
            (SELECT * 
            FROM (
            SELECT * from m_profile a join (SELECT e.vm_meter_id,e.vm_channel_id,e.ph_meter_id,e.ph_channel_id, e.multiplier, c.enable, e.ph_meter_point, f.active_date, case when f.deactiv_date is null then getdate() else f.deactiv_date end as deactiv_date 
            FROM vm_channel_assign e JOIN vm_meter_assign c 
            ON e.ph_meter_id=c.ph_meter_id and e.vm_meter_id=c.vm_meter_id and e.ph_meter_point=c.ph_meter_point 
            JOIN m_location_meters f
            ON c.ph_meter_point=f.id_meter_point and c.ph_meter_id=f.meter_id 
            WHERE c.enable=1) b on a.meter_id=b.ph_meter_id and a.reg_descr_id=b.ph_channel_id and a.meter_t0>=b.active_date and a.meter_t0<=b.deactiv_date) a
            JOIN
            (SELECT a.vm_meter_id as vm_meter_id_2, a.vm_channel_id as vm_channel_id_2, count(*) as "IntEsp" 
            FROM vm_channel_assign a join vm_meter_assign b on a.vm_meter_id=b.vm_meter_id and a.ph_meter_point=b.ph_meter_point and a.ph_meter_id=b.ph_meter_id 
            WHERE b.enable=1 
            GROUP BY a.vm_meter_id, a.vm_channel_id) b
            ON a.vm_meter_id=b.vm_meter_id_2 and a.vm_channel_id=b.vm_channel_id_2) a
            GROUP BY a.vm_meter_id, a.vm_channel_id, a.meter_t0, a.meter_tf, a.local_t0, a.local_tf, a.report,a.IntEsp
            ';
            DB::unprepared($sql);
        }else{

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
