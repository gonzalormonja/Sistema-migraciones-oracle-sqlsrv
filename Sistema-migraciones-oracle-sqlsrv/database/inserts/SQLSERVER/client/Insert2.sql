---- r_parameters
insert into r_parameters values('prm_proprof_desc','Multi Value List','select prof_std_desc from dbo.m_prof_map order by prof_std_desc desc;','Descripción',0,'','')
insert into r_parameters values('prm_desde','Date Picker','','Fecha Desde',0,'','')
insert into r_parameters values('prm_medidor','Multi Value List','select distinct dm.codigo codigo_medidor ,dm.codigo descripcion from dim_medidores dm order by dm.codigo;','Medidores',0,'             ','pbi')
insert into r_parameters values('prm_hasta','Date Picker','','Fecha Hasta',0,'','')
insert into r_parameters values('prm_punto_medida','Multi Value List','select distinct dp.codigo codigo_p_medida ,dp.codigo descripcion from dim_puntos_medida dp order by dp.codigo;','Punto de Medida',0,'      ','pbi')
insert into r_parameters values('prm_canal','Multi Value List','select distinct case when prof_app_id= 0 then proto_descr else prof_std_desc end codigo_usr,case when prof_app_id= 0 then proto_descr else prof_std_desc end descipcion_usr from m_reg_desc_map as b left join m_meters a on b.meter_id=a.meter_id left join m_location_meters as d on a.meter_id=d.meter_id left join m_location as e on d.id_meter_point=e.id_meter_point left join m_prof_map c on b.app_id=c.prof_app_id where case when e.group_id is null then -1 else e.group_id end in (${prm_grupos}) and reg_type in (4,6) union all select ''-100'' codigo_usr, ''Todos'' descripcion_usr order by codigo_usr asc;','Canales',0,'         ','cli')
insert into r_parameters values('prm_option_medidor','Selector Medidor','','Seleccionar Medidor o punto de medida',0,'$(""input[name=prm_option_medidor]"").click(function(){ $(""#prm_medidor_chosen"").chosen(""destroy"");$(""#prm_punto_medida_chosen"").chosen(""destroy""); if($(""input[name=prm_option_medidor]:checked"").val()==1){ $(""#div_prm_medidor"").show(); $(""#prm_punto_medida_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_punto_medida"").hide(); $(""#prm_punto_medida"").val(""""); $(""#prm_medidor_chosen"").chosen({width: ""100%"", placeholder_text_multiple: ""Seleccione""});} else {$(""#prm_medidor_chosen option:selected"").removeAttr(""selected"")
$(""#div_prm_medidor"").hide(); $(""#prm_medidor"").val(""""); $(""#div_prm_punto_medida"").show(); $(""#prm_punto_medida_chosen"").chosen({width: ""100%"", placeholder_text_multiple: ""Seleccione""});}});','')
insert into r_parameters values('prm_fecha_dinamica','Value List','SELECT  id_date, descripcion   from r_dynamic_date','Selector de fecha dinamica',0,'      ','cli')
insert into r_parameters values('prm_option_fecha','Selector Fecha','','Seleccionar Fecha estática o fecha dinámica',0,'$(""input[name=prm_option_fecha]"").click(function(){ if($(""input[name=prm_option_fecha]:checked"").val()==1){ $(""#div_prm_desde"").show(); $(""#div_prm_hasta"").show(); $(""#div_prm_fecha_dinamica"").hide(); $(""#prm_fecha_dinamica"").val(""""); } else { $(""#div_prm_desde"").hide(); $(""#div_prm_hasta"").hide(); $(""#prm_desde"").val(""""); $(""#prm_hasta"").val("""");
$(""#div_prm_fecha_dinamica"").show(); } $("".wizard"").smartWizard(""fixHeight""); });','')
insert into r_parameters values('prm_medidor_cli','Multi Value List','select distinct a.meter_id codigo,a.meter_id descripcion from m_meters a inner join m_location_meters as d on a.meter_id=d.meter_id inner join m_location as e on d.id_meter_point=e.id_meter_point inner join m_app_protos as h on a.app_proto_id=h.proto_id and h.descr <> ''PRIME ALLIANCE'' where case when e.group_id is null then -1 else e.group_id end in (${prm_grupos}) union all select ''-100'' codigo,''Todos'' descripcion order by codigo;','Medidores',0,'                    ','cli')
insert into r_parameters values('prm_marca','Multi Value List','select distinct b.brand_id,concat(brand,'' '',model,'' '',version) marca from  m_meters_brands b left join m_meters a on a.brand_id=b.brand_id left join m_location_meters as d on a.meter_id=d.meter_id left join m_location as e on d.id_meter_point=e.id_meter_point where a.meter_id <> ''FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'' and case when e.group_id is null then -1 else e.group_id end in (${prm_grupos}) order by concat(brand,'' '',model,'' '',version);','Marca-Modelo-Versión',0,'          ','cli')
insert into r_parameters values('prm_proto_fisico','Value List','select distinct b.description codigo,b.description,2 orden from m_phy_protos b left join m_meters a on a.phy_proto_id=b.proto_id left join m_app_protos g on a.app_proto_id=g.proto_id left join m_location_meters as d on a.meter_id=d.meter_id left join m_location as e on d.id_meter_point=e.id_meter_point where case when e.group_id is null then -1 else e.group_id end in (${prm_grupos}) and b.description <> ''No Protocol'' and descr <> ''PRIME ALLIANCE'' union select ''Todos'' codigo,''Todos'' description, 1 orden order by orden,description;','Protocolo Físico',0,'                ','cli')
insert into r_parameters values('prm_proto_app','Value List','select distinct descr codigo,descr,2 orden from m_app_protos b left join m_meters a on a.app_proto_id=b.proto_id left join m_location_meters as d on a.meter_id=d.meter_id left join m_location as e on d.id_meter_point=e.id_meter_point where case when e.group_id is null then -1 else e.group_id end in (${prm_grupos}) and descr <> ''No Protocol'' and descr <> ''PRIME ALLIANCE'' union select ''Todos'' codigo, ''Todos'' descr, 1 orden  order by orden, descr;','Protocolo APP',0,'              ','cli')
insert into r_parameters values('prm_grupo','Value List','select ''Medidor'' cod, ''Medidor'' descripcion  union all  select ''Fecha'' cod, ''Fecha'' descripcion;','Agrupar por',0,'      ','cli')
insert into r_parameters values('prm_desc_registro','Multi Value List','select distinct case when prof_app_id= 0 then proto_descr else prof_std_desc end codigo_usr,case when prof_app_id= 0 then proto_descr else prof_std_desc end descipcion_usr from m_reg_desc_map as b left join m_meters a on b.meter_id=a.meter_id left join m_location_meters as d on a.meter_id=d.meter_id left join m_location as e on d.id_meter_point=e.id_meter_point left join m_prof_map c on b.app_id=c.prof_app_id where case when e.group_id is null then -1 else e.group_id end in (${prm_grupos}) and reg_type in (1) union all select ''-100'' codigo_usr,''Todos'' descripcion_usr order by codigo_usr asc;','Registros',0,'          ','cli')
insert into r_parameters values('prm_desc_registro_inst','Multi Value List','select distinct case when prof_app_id= 0 then proto_descr else prof_std_desc end codigo_usr,case when prof_app_id= 0 then proto_descr else prof_std_desc end descipcion_usr from m_reg_desc_map as b left join m_meters a on b.meter_id =a.meter_id left join m_location_meters as d on a.meter_id=d.meter_id left join m_location as e on d.id_meter_point=e.id_meter_point left join m_prof_map c on b.app_id=c.prof_app_id where case when e.group_id is null then -1 else e.group_id end in (${prm_grupos}) and reg_type in (2,6) union all select ''-100'' codigo_usr,''Todos'' descripcion_usr order by codigo_usr asc;','Registro',0,'          ','cli')
insert into r_parameters values('prm_punto_medida_cli','Multi Value List','select distinct case when d.id_meter_point is null then ''-1'' else d.id_meter_point end codigo_p_medida,case when d.id_meter_point is null then ''-1'' else d.id_meter_point end desc_p_medida from m_location as d inner join m_location_meters a	on d.id_meter_point=a.id_meter_point inner join m_meters b on a.meter_id=b.meter_id inner join m_app_protos c on b.app_proto_id=c.proto_id and descr <> ''PRIME ALLIANCE'' where case when d.group_id is null then -1 else d.group_id end in (${prm_grupos}) union all select ''-100'' codigo_p_medida,''Todos'' desc_p_medida order by codigo_p_medida asc;','Punto de Medida',0,'          ','cli')
insert into r_parameters values('prm_option_medidor_cli','Selector Medidor','','Seleccionar Medidor o punto de medida',0,'   $(""input[name=prm_option_medidor_cli]"").click(function(){ $(""#prm_medidor_cli_chosen"").chosen(""destroy""); $(""#prm_punto_medida_cli_chosen"").chosen(""destroy""); if($(""input[name=prm_option_medidor_cli]:checked"").val()==1){ $(""#div_prm_medidor_cli"").show(); $(""#prm_punto_medida_cli_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_punto_medida_cli"").hide(); $(""#prm_punto_medida_cli"").val(""""); $(""#prm_medidor_cli_chosen"").chosen({width: ""100%"", placeholder_text_multiple: ""Seleccione""});} else {
$(""#prm_medidor_cli_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_medidor_cli"").hide(); $(""#prm_medidor_cli"").val(""""); $(""#div_prm_punto_medida_cli"").show(); $(""#prm_punto_medida_cli_chosen"").chosen({width: ""100%"", placeholder_text_multiple: ""Seleccione""});} });','cli')
insert into r_parameters values('prm_evento','Multi Value List','select distinct case when ev_app_id= 0 then proto_descr else ev_std_desc end codigo_usr,case when ev_app_id= 0 then proto_descr else ev_std_desc end descipcion_usr from m_ev_desc_map as b left join m_meters a on b.meter_id=a.meter_id left join m_location_meters as d on a.meter_id=d.meter_id left join m_location as e on d.id_meter_point=e.id_meter_point left join m_ev_map c on b.app_id=c.ev_app_id where case when e.group_id is null then -1 else e.group_id end in (${prm_grupos}) union all select ''-100'' codigo_usr, ''Todos'' descripcion_usr order by codigo_usr asc;','Evento',0,'        ','cli')
insert into r_parameters values('prm_option_medidor_pmedida_cliente_cli','Radio Button','','Selector de Medidor, Punto de Medida y Cliente',0,'   $(""input[name=prm_option_medidor_pmedida_cliente_cli]"").click(function(){ $(""#prm_medidor_cli_chosen"").chosen(""destroy""); $(""#prm_punto_medida_cli_chosen"").chosen(""destroy""); $(""#prm_cliente_cli_chosen"").chosen(""destroy"");
if($(""input[name=prm_option_medidor_pmedida_cliente_cli]:checked"").val()==1){ $(""#div_prm_medidor_cli"").show(); $(""#prm_medidor_cli_chosen"").chosen({width: ""100%"", placeholder_text_multiple: ""Seleccione""}); $(""#prm_punto_medida_cli_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_punto_medida_cli"").hide(); $(""#prm_punto_medida_cli"").val(""""); $(""#prm_cliente_cli_chosen option:selected"").removeAttr(""selected"");
$(""#div_prm_cliente_cli"").hide(); $(""#prm_cliente_cli"").val(""""); } else if($(""input[name=prm_option_medidor_pmedida_cliente_cli]:checked"").val()==2){ $(""#prm_medidor_cli_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_medidor_cli"").hide(); $(""#prm_medidor_cli"").val(""""); $(""#prm_cliente_cli_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_cliente_cli"").hide(); $(""#prm_cliente_cli"").val(""""); $(""#div_prm_punto_medida_cli"").show(); $(""#prm_punto_medida_cli_chosen"").chosen({width: ""100%"", placeholder_text_multiple: ""Seleccione""}); } else if($(""input[name=prm_option_medidor_pmedida_cliente_cli]:checked"").val()==3){
$(""#prm_medidor_cli_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_medidor_cli"").hide(); $(""#prm_medidor_cli"").val(""""); $(""#prm_punto_medida_cli_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_punto_medida_cli"").hide(); $(""#prm_punto_medida_cli"").val(""""); $(""#div_prm_cliente_cli"").show(); $(""#prm_cliente_cli_chosen"").chosen({width: ""100%"", placeholder_text_multiple: ""Seleccione""});}});','cli')
insert into r_parameters values('prm_cliente_cli','Multi Value List','select distinct concat(f.customer_id,''__'',nombre) customer_id,f.nombre from m_location as e inner join c_customers as f on e.customer_id=f.customer_id where case when e.group_id is null then -1 else e.group_id end in (${prm_grupos}) union all select ''-1__Todos'' customer_id,''Todos'' nombre order by customer_id asc;','Clientes',0,'    ','cli')
insert into r_parameters values('prm_option_medidor_pmedida_cliente_cli','Radio Button','','Selector de Medidor, Punto de Medida y Cliente',0,'  $(""input[name=prm_option_medidor_pmedida_cliente_cli]"").click(function(){ $(""#prm_medidor_cli_chosen"").chosen(""destroy""); $(""#prm_punto_medida_cli_chosen"").chosen(""destroy""); $(""#prm_cliente_cli_chosen"").chosen(""destroy""); if($(""input[name=prm_option_medidor_pmedida_cliente_cli]:checked"").val()==1){ $(""#div_prm_medidor_cli"").show(); $(""#prm_medidor_cli_chosen"").chosen({width: ""100%"", placeholder_text_multiple: ""Seleccione""}); $(""#prm_punto_medida_cli_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_punto_medida_cli"").hide(); $(""#prm_punto_medida_cli"").val(""""); $(""#prm_cliente_cli_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_cliente_cli"").hide(); $(""#prm_cliente_cli"").val("""");
} else if($(""input[name=prm_option_medidor_pmedida_cliente_cli]:checked"").val()==2){ $(""#prm_medidor_cli_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_medidor_cli"").hide(); $(""#prm_medidor_cli"").val(""""); $(""#prm_cliente_cli_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_cliente_cli"").hide(); $(""#prm_cliente_cli"").val(""""); $(""#div_prm_punto_medida_cli"").show(); $(""#prm_punto_medida_cli_chosen"").chosen({width: ""100%"", placeholder_text_multiple: ""Seleccione""}); } else if($(""input[name=prm_option_medidor_pmedida_cliente_cli]:checked"").val()==3){ $(""#prm_medidor_cli_chosen option:selected"").removeAttr(""selected"");
$(""#div_prm_medidor_cli"").hide(); $(""#prm_medidor_cli"").val(""""); $(""#prm_punto_medida_cli_chosen option:selected"").removeAttr(""selected""); $(""#div_prm_punto_medida_cli"").hide(); $(""#prm_punto_medida_cli"").val(""""); $(""#div_prm_cliente_cli"").show(); $(""#prm_cliente_cli_chosen"").chosen({width: ""100%"", placeholder_text_multiple: ""Seleccione""});}});','cli') 
insert into r_parameters values('prm_valor_perfil','Value List','select ''Original'' codigo, ''Original'' descripcion union all select ''Demanda'' codigo, ''Demanda'' descripcion union all select ''Editado'' codigo, ''Editado'' descripcion union all select ''Factor'' codigo, ''Factor'' descripcion;','Valor',0,'  ','cli')
insert into r_parameters values('prm_valor_reg','Value List','select ''Original'' codigo, ''Original'' descripcion union all select ''Factor'' codigo, ''Factor'' descripcion;','Valor',0,'  ','cli')
	
--- r_report_parameters
insert into r_report_parameters values(2,1,2)
insert into r_report_parameters values(2,3,2)
insert into r_report_parameters values(2,4,2)
insert into r_report_parameters values(2,5,2)
insert into r_report_parameters values(2,6,2)
insert into r_report_parameters values(2,7,2)
insert into r_report_parameters values(4,1,3)
insert into r_report_parameters values(4,3,3)
insert into r_report_parameters values(4,4,3)
insert into r_report_parameters values(4,5,3)
insert into r_report_parameters values(4,6,3)
insert into r_report_parameters values(4,7,3)
insert into r_report_parameters values(6,1,9)
insert into r_report_parameters values(8,1,4)
insert into r_report_parameters values(8,3,4)
insert into r_report_parameters values(8,4,4)
insert into r_report_parameters values(8,5,4)
insert into r_report_parameters values(8,6,4)
insert into r_report_parameters values(8,7,4)
insert into r_report_parameters values(9,1,1)
insert into r_report_parameters values(9,3,1)
insert into r_report_parameters values(9,4,1)
insert into r_report_parameters values(9,5,1)
insert into r_report_parameters values(9,6,1)
insert into r_report_parameters values(9,7,1)
insert into r_report_parameters values(10,1,6)
insert into r_report_parameters values(10,2,1)
insert into r_report_parameters values(10,3,5)
insert into r_report_parameters values(10,4,6)
insert into r_report_parameters values(10,5,6)
insert into r_report_parameters values(10,6,5)
insert into r_report_parameters values(10,7,6)
insert into r_report_parameters values(11,2,2)
insert into r_report_parameters values(12,2,4)
insert into r_report_parameters values(13,2,3)
insert into r_report_parameters values(14,3,6)
insert into r_report_parameters values(15,4,9)
insert into r_report_parameters values(16,5,9)
insert into r_report_parameters values(17,1,7)
insert into r_report_parameters values(17,4,7)
insert into r_report_parameters values(17,5,7)
insert into r_report_parameters values(17,7,7)
insert into r_report_parameters values(19,7,9)
insert into r_report_parameters values(20,1,5)
insert into r_report_parameters values(20,4,5)
insert into r_report_parameters values(20,5,5)
insert into r_report_parameters values(20,7,5)
insert into r_report_parameters values(21,1,8)
insert into r_report_parameters values(21,4,8)
insert into r_report_parameters values(21,5,8)
insert into r_report_parameters values(21,7,8)
insert into r_report_parameters values(22,1,10)
insert into r_report_parameters values(23,4,10)
insert into r_report_parameters values(23,5,10)

--m_task_err_codes_res
insert into m_task_err_codes_res values( -80,'Comando invalido')
insert into m_task_err_codes_res values( -82,'Reporte invalido')
insert into m_task_err_codes_res values( -83,'Tarea antigua')
insert into m_task_err_codes_res values( -86,'ID concentrador truncado')
insert into m_task_err_codes_res values( -88,'Comando truncado')
insert into m_task_err_codes_res values( -90,'Fallo interno por locacion de memoria fallida')
insert into m_task_err_codes_res values( 0,'OK')
insert into m_task_err_codes_res values( -1,'Comando terminado por locacion de memoria fallida')
insert into m_task_err_codes_res values( -3,'Comando expirado')
insert into m_task_err_codes_res values( -4,'Comando terminado por solicitud señal de terminacion desde el agent controller')
insert into m_task_err_codes_res values( -5,'No se pudo abrir el archivo xml para parsear')
insert into m_task_err_codes_res values( -6,'Falla de parseo del xml')
insert into m_task_err_codes_res values( -7,'Falla de acceso/inserccion de datos en la db')
insert into m_task_err_codes_res values( -9,'Archivo xml corrupto')
insert into m_task_err_codes_res values( -10,'Fallo en el envio de la request al concentrador')
insert into m_task_err_codes_res values( -11,'No hay espacio en la cola de nuevos comandos')
insert into m_task_err_codes_res values( -13,'No se pudo copiar el archivo xml a procesar desde el ftp a la carpeta temporal')
insert into m_task_err_codes_res values( -14,'Respuesta incorrecta del concentrador')
insert into m_task_err_codes_res values( -15,'Falla de conexión con el ftp')
insert into m_task_err_codes_res values( -17,'ID de concentrador diferente al esperado')
insert into m_task_err_codes_res values( -81,'Fallo interno')
insert into m_task_err_codes_res values( -84,'Fallo consulta servidor SQL')
insert into m_task_err_codes_res values( -87,'Fallo interno')
insert into m_task_err_codes_res values( -89,'Fallo interno')
insert into m_task_err_codes_res values( -91,'Fallo interno')

---m_task_parerr_codes_res
insert into m_task_parerr_codes_res values(0,0,-1,'Error  no especificado','')
insert into m_task_parerr_codes_res values(1,0,100,'Error DC no especificado','Errores DC')
insert into m_task_parerr_codes_res values(1,1,101,'El medidor no existe en la BD del concentrador','Errores DC')
insert into m_task_parerr_codes_res values(1,2,102,'Error interno DC (software)','Errores DC')
insert into m_task_parerr_codes_res values(1,3,103,'Error interno DC (hardware)','Errores DC')
insert into m_task_parerr_codes_res values(2,0,200,'Error PRIME General/no especificado','Errores PRIME ')
insert into m_task_parerr_codes_res values(2,1,201,'Medidor en falla temporal  (TF).','Errores PRIME ')
insert into m_task_parerr_codes_res values(2,2,202,'Medidor en falla permanente (PF)','Errores PRIME ')
insert into m_task_parerr_codes_res values(2,0,0,'“code” is the PRIME error encountered','Errores PRIME ')
insert into m_task_parerr_codes_res values(3,0,300,'Error COSEM General/no especificado','Errores medidor (COSEM)')
insert into m_task_parerr_codes_res values(3,1,301,'Falla de autenticación','Errores medidor (COSEM)')
insert into m_task_parerr_codes_res values(3,2,302,'Error datos (parcialmente recibido, etc).','Errores medidor (COSEM)')
insert into m_task_parerr_codes_res values(3,3,303,'Datos no encontrados en el medidor','Errores medidor (COSEM)')
insert into m_task_parerr_codes_res values(3,4,304,'Orden de ejecución aceptada (escrita) pero no confirmada','Errores medidor (COSEM)')
insert into m_task_parerr_codes_res values(3,5,305,'Orden de ejecución aceptada (escrita) pero no confirmada','Errores medidor (COSEM)')
insert into m_task_parerr_codes_res values(3,6,306,'Orde de ejecución rechazada por DC','Errores medidor (COSEM)')
insert into m_task_parerr_codes_res values(3,0,0,'n “code” is the COSEM error encountered','Errores medidor (COSEM)')
insert into m_task_parerr_codes_res values(10,1,1001,'Estado del interruptor rcvd (S18) desconocido','PROPIETARIOS AGENTE')
insert into m_task_parerr_codes_res values(10,2,1002,'Fallo al insertar los datos del medidor en BD UMS() para medidor no recibido','PROPIETARIOS AGENTE')
insert into m_task_parerr_codes_res values(10,3,1003,'Fallo al insertar datos del medidor en BD','PROPIETARIOS AGENTE')
insert into m_task_parerr_codes_res values(-1,-1,1,'Valor inicialización','PROPIETARIOS AGENTE')

---m_meters
insert into m_meters (sched_id, meter_id, brand_id, tz, prof_last_read, eob_last_read, reg_last_read, ev_last_read, phy_proto_id, app_proto_id, log_level, m_enable,tz_id, tu, tp, switch_state, switch_state_date, is_pulse, master, master_meter_id, last_prn_gen, prn_channels, ami, group_id) values (-1,'MAINTENANCE',1,-3,'2019-02-12 00:00:00.000','2019-02-12 00:00:00.000','2019-02-12 00:00:00.000','2019-02-12 00:00:00.000',0,1,255,1,26,1,1,null,null,0,2,'',null,null,1,null)

---version_bd
insert into version_bd values(getdate(),'1.2')

---V1.3
UPDATE m_commands SET reg_type=4 WHERE type=1


UPDATE m_commands SET reg_type=2 WHERE type=2


UPDATE m_commands SET reg_type=1 WHERE type=5


UPDATE m_commands SET reg_type=3 WHERE type=3


update r_report set type_exe=2 

update r_report set type_exe=1 where DESCRIPTION='prn'


insert into m_brands_commands values(7,15)
insert into m_brands_commands values(8,15)



--V1.3
insert into version_bd values(getdate(),'1.3')

---V1.4
insert m_event_group_c ( id_ev_gp, name_ev_gp, descr_ev_gp)
values (1, 'ESTÁNDAR', 'registro de eventos estándar' ); 

insert m_event_group_c ( id_ev_gp, name_ev_gp, descr_ev_gp)
values (2, 'FRAUD' ,'Registro de eventos de detección de fraude');


insert m_event_group_c ( id_ev_gp, name_ev_gp, descr_ev_gp)
VALUES(3, 'SWITCH CONTROL','Registro de eventos de control de seccionador');

 
insert m_event_group_c ( id_ev_gp, name_ev_gp, descr_ev_gp)
values (4, 'ENERGY QUALITY','Registro de eventos de calidad de energía')


insert m_event_group_c ( id_ev_gp, name_ev_gp, descr_ev_gp)
values (5,'COMUNICATION','Communication Event Log');

insert m_event_group_c ( id_ev_gp, name_ev_gp, descr_ev_gp)
values (6,'ENERGY FAILURE','Registro de eventos de falla de energí');


insert m_event_list_c (groupid,id_ev, name, description)
values(1, 1,'Power Down','Indica un apagado completo del dispositivo');

insert m_event_list_c (groupid,id_ev, name, description)
values(1, 2,'Power Up','Indica que el dispositivo se vuelve a encender después de un apagado completo');

insert m_event_list_c (groupid,id_ev, name, description)
values(1, 3,'Daylight saving time enabled or disabled','Indica el cambio regular desde y hacia el horario de verano');


insert m_event_list_c (groupid,id_ev, name, description)
values(1, 4,'Clock adjusted old','Indica que el reloj ha sido ajustado');


insert m_event_list_c (groupid,id_ev, name, description)
values(1, 5,'Clock adjusted new','Indica que el reloj ha sido ajustado');


insert m_event_list_c (groupid,id_ev, name, description)
values(1, 6,'Clock invalid','Indica que el reloj puede no ser válido, es decir, si la reserva de energía del reloj se ha agotado. Se esTablace en el encendido');


insert m_event_list_c (groupid,id_ev, name, description)
values(1, 7,'Replace Battery','Indica que la batería debe cambiarse debido al fin de vida útil esperado');


insert m_event_list_c (groupid,id_ev, name, description)
values(1, 8,'Battery voltage low','Indica que el voltaje actual de la batería es bajo');


insert m_event_list_c (groupid,id_ev, name, description)
values(1, 9,'TOU activated','Indica que el TOU pasivo ha sido activado');


insert m_event_list_c (groupid,id_ev, name, description)
values(1, 10,'Error register cleared','Indica que el registro de errores fue borrado');

insert m_event_list_c (groupid,id_ev, name, description)
values(1, 11,'Alarm register cleared','Indica que el registro de alarma fue borrado');


insert m_event_list_c (groupid,id_ev, name, description)
values(1, 12,'Program memory error','Indica un error físico o lógico en la memoria del programa');


insert m_event_list_c (groupid,id_ev, name, description)
values
(1, 13,'Ram Error','Indica un error físico o lógico en la memoria RAM'), 
(1, 14,'NV memory error','Indica un error físico o lógico en la memoria no volátil'),
(1, 15,'Watchdog error','Indicates a watch dog reset or a hardware reset of the microcontroller'),
(1, 16,'Measurement system error','Indica un reinicio de vigilancia o un reinicio de hardware del microcontrolador'), 
(1, 17,'Firmware ready foractivation','Indica que el nuevo firmware ha sido descargado y verificado con éxito'), 
(1, 18,'Firmware activated','Indica que un nuevo firmware ha sido activado'),
(1, 19,'Passive TOU programmed','Se programaron las estructuras pasivas de TOU'),
(1, 20,'External alert detected','Indica la señal detectada en el terminal de entrada del medidor'), 
(1, 47, '' , 'One or more parameters changed'),
(1, 48,'Global key(s) changed','Una o más teclas globales cambiaron') , 
(1, 51,'FW verification failed','Indica que la verificación del firmware transferido ha fallado, es decir') ,
(1, 52,'Unexpected consumption','Indica que el consumo se detecta al menos en una fase cuando se desconecta el conector'), 
(1, 253,'Meter data clear','Indica que los datos del medidor están limpios') , 
(1, 254,'Load profile clear','Indica claro perfil de carga y perfil de facturación'), 
(1, 255,'Event log cleared','Indica que el registro de eventos se ha borrado') ;



insert m_event_list_c (groupid,id_ev, name, description)
values(2, 40,'Terminal cover removed','Indica que la tapa del terminal ha sido quitada') , (2, 41,'Terminal cover closed','Indica que la tapa del terminal ha sido cerrada') , 
	  (2, 42,'Strong DC field detected','Indica que se ha detectado un fuerte campo magnético de DC') , (2, 43,'No strong DC field anymore','Indica que el fuerte campo magnético de corriente continua ha desaparecido') , 
	  (2, 44,'Main cover removed','Indica que la tapa principal ha sido retirada') , (2,45,'Main cover closed','Indica que la tapa principal ha sido cerrada') , 
	  (2, 46,'Association authentication failure','Indica que un usuario intentó obtener acceso a LLS con Contraseña incorrecta' ) , (2, 49,'Decryption or authentication failure','Descifrado con clave actualmente válida') , 
	  (2, 50,'Replay attack','El valor del contador de tramas de recepción es menor o igual al último contador de tramas recibido con éxito en el APDU recibido') , (2, 91,'Current Reversal start','Indica exportación inesperada de energía'), 
	  (2, 257,'Current Reversal end','Indica importación de energía') , (2, 221,'Phase Current Reversal start','Indica exportación inesperada de energía') , 
	  (2, 222,'Phase Current Reversal end','Indica exportación inesperada de energía') , (2, 223,'Neutral Current Reversal start','Indica exportación inesperada de energía') , 
	  (2, 224,'Neutral Current Reversal end','Indica exportación inesperada de energía') , (2, 300,'Module cover open','Indica que la cubierta del módulo ha sido removida') , 
	  (2, 301,'Module cover close','Indica que la cubierta del módulo ha sido cerrada') , (2, 255,'Event log cleared','Indica que el registro de eventos se ha borrado') ;



insert m_event_list_c (groupid,id_ev, name, description) 
values (3, 59,'Disconnector ready formanual reconnection','Indica que el seccionador se ha configurado en el estado Ready_for_reconnection') , (3, 60,'Manual disconnection','Indica que el seccionador ha sido desconectado manualmente') , 
(3, 61,'Manual connection','Indica que el seccionador ha sido conectado manualmente') , (3, 62,'Remote disconnection','Indica que el seccionador ha sido desconectado de forma remota') , 
(3, 63,'Remote connection','Indica que el seccionador se ha conectado de forma remota') , (3, 64,'Local disconnect','Indica que el seccionador se ha desconectado localmente') ,
(3, 65,'Limiter threshold exceeded','Indica que se ha superado el umbral del limitador') , (3, 66,'Limiter threshold normal','Indica que el valor supervisado del limitador cayó por debajo del umbral') ,
(3, 67,'Limiter threshold changed','Indica que el umbral del limitador ha sido cambiado') , (3, 68,'Disconnect/Reconnect failure','Indica que se ha producido una falla de desconexión o reconexión') , 
(3, 69,'Local reconnection','Indica que el seccionador se ha vuelto a conectar localmente') , (3, 70,'Supervision monitor 1 threshold exceeded','Indica que se ha superado el umbral de supervisión de supervisión') , 
(3, 71,'Supervision monitor 1 threshold ok','Indica que el valor supervisado cayó por debajo del umbral') , (3, 209,'Current over start L1','Indica que se ha superado el umbral actual') , 
(3, 210,'Current over end L1','Indica que se ha superado el umbral actual') , (3, 227,'Power over start L1','Indica que se ha excedido el umbral de potencia activa'), 
(3, 228,'Power over end L1','Indica que se ha excedido el umbral de potencia activa') , (3, 255,'Event log cleared','Indica que el registro de eventos se ha borrado');


insert m_event_list_c (groupid,id_ev, name, description) 
values (4, 200,'Under voltage L1','Indica que se detectó bajo voltaje en al menos la fase L1') , (4, 203,'Over voltage L1','Indica que se detectó sobre voltaje en al menos la fase L1') ,
	   (4, 331,'Sag voltage L1','Indica que se detectó bajo voltaje en al menos la fase L1') , (4, 337,'Swell voltage L1','Indica que se detectó sobre voltaje en al menos la fase L1') , 
	   (4, 255,'Event log cleared','Indica que el registro de eventos se ha borrado') ;



insert m_event_list_c (groupid,id_ev, name, description) 
values (5, 140,'No connection timeout','No ha habido comunicación remota en la capa de aplicación durante un período de tiempo predefinido') , (5, 141,'Modem Initialization failure','Respuesta del módem a los comandos de inicialización') , 
       (5, 142,'SIM Card failure','La tarjeta SIM no está insertada o no se reconoce') , (5, 143,'SIM Card ok','La tarjeta SIM ha sido detectada correctamente') , 
	   (5, 144,'GSM registration failure','El registro del módem en la red GSM no fue exitoso') , (5, 145,'GPRS registration failure','El registro del módem en la red GPRS no fue exitoso') , 
	   (5, 146,'PDP context established','Se esTablace el contexto PDP') , (5, 147,'PDP context destroyed','Se destruye el contexto PDP') , 
	   (5, 148,'PDP context failure','No se recuperaron contextos válidos de PDP') , (5, 149,'Modem SW reset','Módem reiniciado por reinicio de SW') , 
	   (5, 150,'Modem HW reset','Módem reiniciado por reinicio de HW') , (5, 151,'GSM outgoing connection','El módem está conectado correctamente' ) , 
	   (5, 152,'GSM incoming connection','El módem está conectado correctamente') , (5, 153,'GSM hang-up','El módem está desconectado') ,
	   (5, 154,'Diagnostic failure','Respuesta del módem al comando (s) de diagnóstico AT') , (5, 155,'User initialization failure','Comando (s) AT de inicialización del módem') , 
	   (5, 156,'Signal quality low','Intensidad de la señal demasiado baja') , (5, 157,'Auto Answer Number of calls exceeded','El número de llamadas ha excedido') , 
	   (5, 158,'Local communication attempt','Indica que se ha iniciado una comunicación exitosa en cualquier puerto local') , (5, 255,'Event log cleared','Indica que el registro de eventos se ha borrado') ;
 

insert m_event_list_c (groupid,id_ev, name, description) 
values (6, 0,'','Tiempo apagado por más de 60 segundos');


/*INSERT INTO [dbo].[m_app_protos]
           ([proto_id]
           ,[descr])
     VALUES
           (101,'Clou')

*/
INSERT INTO [dbo].[m_commands_res]
           ([command_id]
           ,[string]
           ,[type]
           ,[type_desc])
     VALUES
           (18,'ValHexa' , 'C15', 'Eventos del concentrador')


insert into version_bd values(getdate(),'1.4')


INSERT INTO m_origin VALUES('Recolección automática', 2)

INSERT INTO m_origin VALUES('Importación manual', 2)

INSERT INTO m_origin VALUES('Estimación',3)


INSERT INTO [m_meters_brands] ([brand],[model],[version],[def_app_proto],[def_phy_proto]) VALUES ('ITRON','EM420i','1.0',9,1)


INSERT INTO [m_brands_commands] VALUES (1,(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

INSERT INTO [m_brands_commands] VALUES (2,(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

INSERT INTO [m_brands_commands] VALUES (3,(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

INSERT INTO [m_brands_commands] VALUES (4,(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

INSERT INTO [m_brands_commands] VALUES (5,(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

INSERT INTO [m_brands_commands] VALUES (7,(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

INSERT INTO [m_brands_commands] VALUES (8,(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))


--- m_meters_templates
insert into m_meters_templates values(9,'app','acse_auth_choice','0',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'app','acse_auth_value','12345678',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'app','acse_context_name','1',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'app','acse_mechanism_name','1',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'app','acse_proto_version','1',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'app','dlms_conformance','7805',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'app','dlms_conformance_legacy_tag','0',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'app','dlms_key_value','',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'app','dlms_max_recv_pdu_size','0',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'app','dlms_use_rlrq','1',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'app','dlms_version','6',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'app','log_level','255',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values (9, N'app', N'acse_system_title', N'', (select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )

insert into m_meters_templates values(9, N'app', N'acse_key_authentication', N'', (select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )

insert into m_meters_templates values (9, N'app', N'acse_key_encryption', N'', (select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )

insert into m_meters_templates values(9,'link','dest_port','1',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'link','version','1',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'link','tr','30',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'link','src_port','1',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'link','retries','3',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'link','ph_conn_tout','5000',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))

insert into m_meters_templates values(9,'link','log_level','255',(select brand_id from m_meters_brands where brand = 'ITRON' and model = 'EM420i' and version = '1.0'))


/*cortoScript*/
DECLARE @brand AS VARCHAR(32)
DECLARE @model AS VARCHAR(32)
DECLARE @version AS VARCHAR(32)
DECLARE @app_proto_descr AS VARCHAR(32)
DECLARE @phy_proto_descr AS VARCHAR(32)
DECLARE @app_proto_id as INT
DECLARE @phy_proto_id as INT
DECLARE @brand_id AS INT

DECLARE @cmd_profile AS INT
DECLARE @cmd_registers AS INT
DECLARE @cmd_events AS INT
DECLARE @cmd_set_clock AS INT
DECLARE @cmd_eob AS INT

DECLARE @acse_auth_choice AS INT
DECLARE @acse_auth_value AS VARCHAR(32)
DECLARE @acse_context_name AS INT
DECLARE @acse_mechanism_name AS INT
DECLARE @acse_proto_version AS INT
DECLARE @dlms_conformance AS INT
DECLARE @dlms_conformance_legacy_tag AS INT
DECLARE @dlms_key_value AS VARCHAR(32)
DECLARE @dlms_max_recv_pdu_size AS INT
DECLARE @dlms_use_rlrq AS INT
DECLARE @dlms_version AS INT
DECLARE @app_log_level AS INT
DECLARE @link_log_level AS INT

DECLARE @dest_addr_len AS INT
DECLARE @dest_addr_lower AS INT
DECLARE @dest_addr_upper AS INT
DECLARE @len_rx AS INT
DECLARE @len_tx AS INT
DECLARE @neg_i_len AS INT
DECLARE @ph_conn_tout AS INT
DECLARE @retries AS INT
DECLARE @src_addr_len AS INT
DECLARE @src_addr_lower AS INT
DECLARE @src_addr_upper AS INT
DECLARE @tp AS INT
DECLARE @tr AS INT
DECLARE @w_rx AS INT
DECLARE @w_tx AS INT

-- ==================================================
-- Asignacion de variables
-- ==================================================

SET @brand = 'ELGAMA'
SET @model = 'Gama300'
SET @version = '1.0'
SET @app_proto_descr = 'xDLMS/COSEM/HDLC'
SET @phy_proto_descr = 'TCP/IP'

SET @app_proto_id = (SELECT proto_id FROM m_app_protos WHERE descr = @app_proto_descr)
SET @phy_proto_id = (SELECT proto_id FROM m_phy_protos WHERE description = @phy_proto_descr)

SET @cmd_profile = 1
SET @cmd_registers = 2
SET @cmd_events = 3
SET @cmd_set_clock = 4
SET @cmd_eob = 5

SET @acse_auth_choice = 0
SET @acse_auth_value=''
SET @acse_context_name = 2
SET @acse_mechanism_name = 1
SET @acse_proto_version = -1
SET @dlms_conformance = 1841952
SET @dlms_conformance_legacy_tag = 0
SET @dlms_key_value = ''
SET @dlms_max_recv_pdu_size = 0
SET @dlms_use_rlrq = 1
SET @dlms_version = 6
SET @app_log_level = 255

SET @dest_addr_len = 4
SET @dest_addr_lower = 0
SET @dest_addr_upper = 1
SET @len_rx = 128
SET @len_tx = 128
SET @link_log_level = 255
SET @neg_i_len = 1
SET @ph_conn_tout = 5000
SET @retries = 5
SET @src_addr_len = 1
SET @src_addr_lower = 0
SET @src_addr_upper = 32
SET @tp = 150
SET @tr = 150
SET @w_rx = 7
SET @w_tx = 2

-- ==================================================
-- Ejecucion del script
-- ==================================================



/* -- Tabla: m_meters_brands */
INSERT INTO 
[m_meters_brands] ([brand],[model],[version],[def_app_proto],[def_phy_proto]) VALUES (@brand, @model, @version, @app_proto_id, @phy_proto_id)

/* -- Tabla: m_brands_commands */
SET @brand_id = (SELECT [brand_id] FROM [m_meters_brands] WHERE [brand] = @brand AND [model] = @model )
INSERT INTO [m_brands_commands] VALUES (@cmd_profile,  @brand_id) /* PROFILE   */
INSERT INTO [m_brands_commands] VALUES (@cmd_registers,@brand_id) /* REGISTERS */
INSERT INTO [m_brands_commands] VALUES (@cmd_events,   @brand_id) /* EVENTS    */
INSERT INTO [m_brands_commands] VALUES (@cmd_set_clock,@brand_id) /* SET CLOCK */
INSERT INTO [m_brands_commands] VALUES (@cmd_eob,      @brand_id) /* EOB       */

/* -- Tabla: m_meters_template */
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_auth_choice',            @acse_auth_choice,            @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_auth_value',             @acse_auth_value,             @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_context_name',           @acse_context_name,           @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_mechanism_name',         @acse_mechanism_name,         @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_proto_version',          @acse_proto_version,          @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_conformance',            @dlms_conformance,            @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_conformance_legacy_tag', @dlms_conformance_legacy_tag, @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_key_value',              @dlms_key_value,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_max_recv_pdu_size',      @dlms_max_recv_pdu_size,      @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_use_rlrq',               @dlms_use_rlrq,               @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_version',                @dlms_version,                @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'log_level',                   @app_log_level,               @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'dest_addr_len',               @dest_addr_len,               @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'dest_addr_lower',             @dest_addr_lower,             @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'dest_addr_upper',             @dest_addr_upper,             @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'len_rx',                      @len_rx,                      @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'len_tx',                      @len_tx,                      @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'log_level',                   @link_log_level,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'neg_i_len',                   @neg_i_len,                   @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'ph_conn_tout',                @ph_conn_tout,                @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'retries',                     @retries,                     @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'src_addr_len',                @src_addr_len,                @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'src_addr_lower',              @src_addr_lower,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'src_addr_upper',              @src_addr_upper,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'tp',                          @tp,                          @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'tr',                          @tr,                          @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'w_rx',                        @w_rx,                        @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'w_tx',                        @w_tx,                        @brand_id) 





INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (100 ,'VERIFY_METER_SUPPORT' , 'Verifica que el brand, model y version esten soportados')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (101 ,'CONNECT' , 'Establecimiento de conexion con el medidor')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (102 ,'PRE_INIT' , 'Preinicializacion (solo DLMS)')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (103 ,'INIT' , 'Inicialilizacion')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (104 ,'TERM' , 'Deinicializacion')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (105 ,'DISCONNECT' , 'Finalizacion de la conexion con el medidor')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (106, 'STAGE_METER_LOOK_UP' , 'Busqueda de medidor en daisy chain')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (1,   'GET_PROFILE' , 'Lectura perfil log 0')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (11,  'GET_PROFILE1' , 'Lectura perfil log 1')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (12,  'GET_PROFILE2' , 'Lectura perfil log 2')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (2,   'GET_REGISTERS' , 'Lectura de registros instantaneos')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (3,   'GET_EVENTS' , 'Lectura de eventos')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (4,   'SET_CLOCK' , 'Seteo de clock')
INSERT INTO [dbo].[m_call_stages] ([stage_id],[stage_name],[stage_descr]) VALUES (5,   'GET_EOB' , 'Lectura de EOB')



INSERT INTO d_cube_config VALUES ('profile', 5000000, '6M', '22:00', 1000000, 10000000, '1m',5000000)
INSERT INTO d_cube_config VALUES ('IR', 5000000, '6M', '02:00', 1000000, 10000000, '1m',5000000)
INSERT INTO d_cube_config VALUES ('EOB', 5000000, '6M', '04:00', 1000000, 10000000, '1m',5000000)
INSERT INTO d_cube_config VALUES ('event', 5000000, '6M', '06:00', 1000000, 10000000, '1m',5000000)

update m_meters_templates set value = -1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'acse_proto_version'
update m_meters_templates set value = 2 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'acse_context_name'
update m_meters_templates set value = 0 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'acse_auth_choice'
update m_meters_templates set value = 1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'acse_mechanism_name'
update m_meters_templates set value = 6 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_version'
update m_meters_templates set value = 0 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_max_recv_pdu_size'
update m_meters_templates set value = 1841952 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_conformance'
update m_meters_templates set value = 0 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_conformance_legacy_tag'
update m_meters_templates set value = 1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_use_rlrq'
update m_meters_templates set value = 255 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'app' and parameter = 'log_level'

update m_meters_templates set value = 1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'neg_i_len'
update m_meters_templates set value = 5000 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'ph_conn_tout'
update m_meters_templates set value = 128 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'len_rx'
update m_meters_templates set value = 128 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'len_tx'
update m_meters_templates set value = 7 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'w_rx'
update m_meters_templates set value = 2 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'w_tx'
update m_meters_templates set value = 5 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'retries'
update m_meters_templates set value = 150 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'tp'
update m_meters_templates set value = 150 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'tr'
update m_meters_templates set value = 1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'src_addr_len'
update m_meters_templates set value = 0 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'src_addr_lower'
update m_meters_templates set value = 32 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'src_addr_upper'
update m_meters_templates set value = 4 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'dest_addr_len'
update m_meters_templates set value = 9752 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'dest_addr_lower'
update m_meters_templates set value = 1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'dest_addr_upper'
update m_meters_templates set value = 255 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'log_level'


update d_cube_config set max_reg_render = 5000000

INSERT INTO m_unesa values(' Q','GD','Circutor','Contador')

UPDATE m_unesa SET model = 'Supervisor' WHERE model_unesa = 'KX'

DECLARE
	@ProtoId int,
	@BrandId int
SELECT @ProtoId = proto_id FROM m_app_protos WHERE descr = 'xDLMS/COSEM/IP'
SELECT @BrandId = brand_id FROM m_meters_brands WHERE brand = 'Actaris'

DELETE m_meters_templates where proto_id = @ProtoId and type = 'app' and parameter = 'acse_auth_choice' and value = '0' and brand_id = @BrandId

DELETE m_meters_templates where proto_id = @ProtoId and type = 'app' and parameter = 'acse_auth_value' and value = 'ABCDEFGH' and brand_id = @BrandId

DELETE m_meters_templates where proto_id = @ProtoId and type = 'app' and parameter = 'acse_context_name' and value = '1' and brand_id = @BrandId

DELETE m_meters_templates where proto_id = @ProtoId and type = 'app' and parameter = 'acse_mechanism_name' and value = '1' and brand_id = @BrandId

DELETE m_meters_templates where proto_id = @ProtoId and type = 'app' and parameter = 'acse_proto_version' and value = '1' and brand_id = @BrandId

DELETE m_meters_templates where proto_id = @ProtoId and type = 'app' and parameter = 'dlms_conformance' and value = '4125' and brand_id = @BrandId

DELETE m_meters_templates where proto_id = @ProtoId and type = 'app' and parameter = 'dlms_conformance_legacy_tag' and value = '0' and brand_id = @BrandId

DELETE m_meters_templates where proto_id = @ProtoId and type = 'app' and parameter = 'dlms_key_value' and value = '' and brand_id = @BrandId

DELETE m_meters_templates where proto_id = @ProtoId and type = 'app' and parameter = 'dlms_max_recv_pdu_size' and value = '0' and brand_id = @BrandId

DELETE m_meters_templates where proto_id = @ProtoId and type = 'app' and parameter = 'dlms_use_rlrq' and value = '1' and brand_id = @BrandId

DELETE m_meters_templates where proto_id = @ProtoId and type = 'app' and parameter = 'dlms_version' and value = '6' and brand_id = @BrandId

DELETE m_meters_templates where proto_id = @ProtoId and type = 'app' and parameter = 'log_level' and value = '255' and brand_id = @BrandId

INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (@ProtoId, 'app', 'acse_auth_choice', '0', @BrandId)

INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (@ProtoId,'app','acse_auth_value','ABCDEFGH', @BrandId)

INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) values(@ProtoId,'app','acse_context_name','1', @BrandId)

INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (@ProtoId,'app','acse_mechanism_name','1', @BrandId)

INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (@ProtoId,'app','acse_proto_version','1', @BrandId)

INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (@ProtoId,'app','dlms_conformance','4125', @BrandId)

INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (@ProtoId,'app','dlms_conformance_legacy_tag','0', @BrandId)

INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (@ProtoId,'app','dlms_key_value','', @BrandId)

INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (@ProtoId,'app','dlms_max_recv_pdu_size','0', @BrandId)

INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (@ProtoId,'app','dlms_use_rlrq','1', @BrandId)

INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (@ProtoId,'app','dlms_version','6', @BrandId)

INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (@ProtoId,'app','log_level','255', @BrandId)

insert into m_meters_templates values((SELECT proto_id from m_app_protos where descr='ABB'),'abb','password','00000000',(SELECT brand_id from m_meters_brands where brand='ELSTER' AND model='A1800'));


/*cortoScript*/
DECLARE @brand AS VARCHAR(32)
DECLARE @model AS VARCHAR(32)
DECLARE @version AS VARCHAR(32)
DECLARE @app_proto_descr AS VARCHAR(32)
DECLARE @phy_proto_descr AS VARCHAR(32)
DECLARE @app_proto_id as INT
DECLARE @phy_proto_id as INT
DECLARE @brand_id AS INT

DECLARE @cmd_profile AS INT
DECLARE @cmd_registers AS INT
DECLARE @cmd_events AS INT
DECLARE @cmd_set_clock AS INT
DECLARE @cmd_eob AS INT

DECLARE @acse_auth_choice AS INT
DECLARE @acse_auth_value AS VARCHAR(32)
DECLARE @acse_context_name AS INT
DECLARE @acse_mechanism_name AS INT
DECLARE @acse_proto_version AS INT
DECLARE @dlms_conformance AS INT
DECLARE @dlms_conformance_legacy_tag AS INT
DECLARE @dlms_key_value AS VARCHAR(32)
DECLARE @dlms_max_recv_pdu_size AS INT
DECLARE @dlms_use_rlrq AS INT
DECLARE @dlms_version AS INT
DECLARE @app_log_level AS INT
DECLARE @link_log_level AS INT

DECLARE @dest_addr_len AS INT
DECLARE @dest_addr_lower AS INT
DECLARE @dest_addr_upper AS INT
DECLARE @len_rx AS INT
DECLARE @len_tx AS INT
DECLARE @neg_i_len AS INT
DECLARE @ph_conn_tout AS INT
DECLARE @retries AS INT
DECLARE @src_addr_len AS INT
DECLARE @src_addr_lower AS INT
DECLARE @src_addr_upper AS INT
DECLARE @tp AS INT
DECLARE @tr AS INT
DECLARE @w_rx AS INT
DECLARE @w_tx AS INT

-- ==================================================
-- Asignacion de variables
-- ==================================================

SET @brand = 'Hexing'
SET @model = 'HXF300'
SET @version = '1.0'
SET @app_proto_descr = 'xDLMS/COSEM/HDLC'
SET @phy_proto_descr = 'TCP/IP'

SET @app_proto_id = (SELECT proto_id FROM m_app_protos WHERE descr = @app_proto_descr)
SET @phy_proto_id = (SELECT proto_id FROM m_phy_protos WHERE description = @phy_proto_descr)

SET @cmd_profile = 1
SET @cmd_registers = 2
SET @cmd_events = 3
SET @cmd_set_clock = 4
SET @cmd_eob = 5

SET @acse_auth_choice = 0
SET @acse_auth_value='00000000'
SET @acse_context_name = 1
SET @acse_mechanism_name = 1
SET @acse_proto_version = 1
SET @dlms_conformance = 32287
SET @dlms_conformance_legacy_tag = 0
SET @dlms_key_value = ''
SET @dlms_max_recv_pdu_size = 65535
SET @dlms_use_rlrq = 1
SET @dlms_version = 6
SET @app_log_level = 255

SET @dest_addr_len = 1
SET @dest_addr_lower = 1
SET @dest_addr_upper = 0
SET @len_rx = 128
SET @len_tx = 128
SET @link_log_level = 255
SET @neg_i_len = 1
SET @ph_conn_tout = 5000
SET @retries = 5
SET @src_addr_len = 1
SET @src_addr_lower = 0
SET @src_addr_upper = 1
SET @tp = 150
SET @tr = 150
SET @w_rx = 7
SET @w_tx = 2

-- ==================================================
-- Ejecucion del script
-- ==================================================



/* -- Tabla: m_meters_brands */
INSERT INTO 
[m_meters_brands] ([brand],[model],[version],[def_app_proto],[def_phy_proto]) VALUES (@brand, @model, @version, @app_proto_id, @phy_proto_id)

/* -- Tabla: m_brands_commands */
SET @brand_id = (SELECT [brand_id] FROM [m_meters_brands] WHERE [brand] = @brand AND [model] = @model )
INSERT INTO [m_brands_commands] VALUES (@cmd_profile,  @brand_id) /* PROFILE   */
INSERT INTO [m_brands_commands] VALUES (@cmd_registers,@brand_id) /* REGISTERS */
INSERT INTO [m_brands_commands] VALUES (@cmd_events,   @brand_id) /* EVENTS    */
INSERT INTO [m_brands_commands] VALUES (@cmd_set_clock,@brand_id) /* SET CLOCK */
INSERT INTO [m_brands_commands] VALUES (@cmd_eob,      @brand_id) /* EOB       */

/* -- Tabla: m_meters_template */
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_auth_choice',            @acse_auth_choice,            @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_auth_value',             @acse_auth_value,             @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_context_name',           @acse_context_name,           @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_mechanism_name',         @acse_mechanism_name,         @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_proto_version',          @acse_proto_version,          @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_conformance',            @dlms_conformance,            @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_conformance_legacy_tag', @dlms_conformance_legacy_tag, @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_key_value',              @dlms_key_value,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_max_recv_pdu_size',      @dlms_max_recv_pdu_size,      @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_use_rlrq',               @dlms_use_rlrq,               @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_version',                @dlms_version,                @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'log_level',                   @app_log_level,               @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'dest_addr_len',               @dest_addr_len,               @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'dest_addr_lower',             @dest_addr_lower,             @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'dest_addr_upper',             @dest_addr_upper,             @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'len_rx',                      @len_rx,                      @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'len_tx',                      @len_tx,                      @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'log_level',                   @link_log_level,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'neg_i_len',                   @neg_i_len,                   @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'ph_conn_tout',                @ph_conn_tout,                @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'retries',                     @retries,                     @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'src_addr_len',                @src_addr_len,                @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'src_addr_lower',              @src_addr_lower,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'src_addr_upper',              @src_addr_upper,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'tp',                          @tp,                          @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'tr',                          @tr,                          @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'w_rx',                        @w_rx,                        @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'w_tx',                        @w_tx,                        @brand_id) 


update r_parameters set CONSULTA = 'select distinct case when d.id_meter_point is null then ''-1'' else d.id_meter_point end codigo_p_medida,case when d.name_meter_point is null then ''-1'' else d.name_meter_point end desc_p_medida from m_location as d inner join m_location_meters a	on d.id_meter_point=a.id_meter_point inner join m_meters b on a.meter_id=b.meter_id inner join m_app_protos c on b.app_proto_id=c.proto_id and descr <> ''PRIME ALLIANCE'' where case when d.group_id is null then -1 else d.group_id end in (${prm_grupos}) union all select ''-100'' codigo_p_medida,''Todos'' desc_p_medida order by codigo_p_medida asc;' where PARAMETER='prm_punto_medida_cli'
/*cortoScript*/
DECLARE @brand AS VARCHAR(32)
DECLARE @model AS VARCHAR(32)
DECLARE @version AS VARCHAR(32)
DECLARE @app_proto_descr AS VARCHAR(32)
DECLARE @phy_proto_descr AS VARCHAR(32)
DECLARE @app_proto_id as INT
DECLARE @phy_proto_id as INT
DECLARE @brand_id AS INT

DECLARE @cmd_profile AS INT
DECLARE @cmd_registers AS INT
DECLARE @cmd_events AS INT
DECLARE @cmd_set_clock AS INT
DECLARE @cmd_eob AS INT

DECLARE @acse_auth_choice AS INT
DECLARE @acse_auth_value AS VARCHAR(32)
DECLARE @acse_context_name AS INT
DECLARE @acse_mechanism_name AS INT
DECLARE @acse_proto_version AS INT
DECLARE @dlms_conformance AS INT
DECLARE @dlms_conformance_legacy_tag AS INT
DECLARE @dlms_key_value AS VARCHAR(32)
DECLARE @dlms_max_recv_pdu_size AS INT
DECLARE @dlms_use_rlrq AS INT
DECLARE @dlms_version AS INT
DECLARE @app_log_level AS INT
DECLARE @link_log_level AS INT

DECLARE @dest_addr_len AS INT
DECLARE @dest_addr_lower AS INT
DECLARE @dest_addr_upper AS INT
DECLARE @len_rx AS INT
DECLARE @len_tx AS INT
DECLARE @neg_i_len AS INT
DECLARE @ph_conn_tout AS INT
DECLARE @retries AS INT
DECLARE @src_addr_len AS INT
DECLARE @src_addr_lower AS INT
DECLARE @src_addr_upper AS INT
DECLARE @tp AS INT
DECLARE @tr AS INT
DECLARE @w_rx AS INT
DECLARE @w_tx AS INT

-- ==================================================
-- Asignacion de variables
-- ==================================================

SET @brand = 'Actaris'
SET @model = 'ACE6000'
SET @version = '1.0'
SET @app_proto_descr = 'xDLMS/COSEM/HDLC'
SET @phy_proto_descr = 'TCP/IP'

SET @app_proto_id = (SELECT proto_id FROM m_app_protos WHERE descr = @app_proto_descr)
SET @phy_proto_id = (SELECT proto_id FROM m_phy_protos WHERE description = @phy_proto_descr)

SET @cmd_profile = 1
SET @cmd_registers = 2
SET @cmd_events = 3
SET @cmd_set_clock = 4
SET @cmd_eob = 5

SET @acse_auth_choice = 0
SET @acse_auth_value='ABCDEFGH'
SET @acse_context_name = 1
SET @acse_mechanism_name = 1
SET @acse_proto_version = 1
SET @dlms_conformance = 4125
SET @dlms_conformance_legacy_tag = 0
SET @dlms_key_value = ''
SET @dlms_max_recv_pdu_size = 0
SET @dlms_use_rlrq = 1
SET @dlms_version = 6
SET @app_log_level = 255

SET @dest_addr_len = 4
SET @dest_addr_lower = 17
SET @dest_addr_upper = 1
SET @len_rx = 128
SET @len_tx = 128
SET @link_log_level = 255
SET @neg_i_len = 1
SET @ph_conn_tout = 5000
SET @retries = 5
SET @src_addr_len = 1
SET @src_addr_lower = 0
SET @src_addr_upper = 7
SET @tp = 30
SET @tr = 100
SET @w_rx = 7
SET @w_tx = 2

-- ==================================================
-- Ejecucion del script
-- ==================================================



/* -- Tabla: m_meters_brands */
INSERT INTO 
[m_meters_brands] ([brand],[model],[version],[def_app_proto],[def_phy_proto]) VALUES (@brand, @model, @version, @app_proto_id, @phy_proto_id)

/* -- Tabla: m_brands_commands */
SET @brand_id = (SELECT [brand_id] FROM [m_meters_brands] WHERE [brand] = @brand AND [model] = @model )
INSERT INTO [m_brands_commands] VALUES (@cmd_profile,  @brand_id) /* PROFILE   */
INSERT INTO [m_brands_commands] VALUES (@cmd_registers,@brand_id) /* REGISTERS */
INSERT INTO [m_brands_commands] VALUES (@cmd_events,   @brand_id) /* EVENTS    */
INSERT INTO [m_brands_commands] VALUES (@cmd_set_clock,@brand_id) /* SET CLOCK */
INSERT INTO [m_brands_commands] VALUES (@cmd_eob,      @brand_id) /* EOB       */

/* -- Tabla: m_meters_template */
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_auth_choice',            @acse_auth_choice,            @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_auth_value',             @acse_auth_value,             @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_context_name',           @acse_context_name,           @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_mechanism_name',         @acse_mechanism_name,         @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'acse_proto_version',          @acse_proto_version,          @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_conformance',            @dlms_conformance,            @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_conformance_legacy_tag', @dlms_conformance_legacy_tag, @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_key_value',              @dlms_key_value,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_max_recv_pdu_size',      @dlms_max_recv_pdu_size,      @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_use_rlrq',               @dlms_use_rlrq,               @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'dlms_version',                @dlms_version,                @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'log_level',                   @app_log_level,               @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'dest_addr_len',               @dest_addr_len,               @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'dest_addr_lower',             @dest_addr_lower,             @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'dest_addr_upper',             @dest_addr_upper,             @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'len_rx',                      @len_rx,                      @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'len_tx',                      @len_tx,                      @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'log_level',                   @link_log_level,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'neg_i_len',                   @neg_i_len,                   @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'ph_conn_tout',                @ph_conn_tout,                @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'retries',                     @retries,                     @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'src_addr_len',                @src_addr_len,                @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'src_addr_lower',              @src_addr_lower,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'src_addr_upper',              @src_addr_upper,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'tp',                          @tp,                          @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'tr',                          @tr,                          @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'w_rx',                        @w_rx,                        @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'w_tx',                        @w_tx,                        @brand_id) 

/*cortoScript*/

DECLARE @brand AS VARCHAR(32)
DECLARE @model AS VARCHAR(32)
DECLARE @version AS VARCHAR(32)
DECLARE @app_proto_descr AS VARCHAR(32)
DECLARE @phy_proto_descr AS VARCHAR(32)
DECLARE @app_proto_id as INT
DECLARE @phy_proto_id as INT
DECLARE @brand_id AS INT

DECLARE @cmd_profile AS INT
DECLARE @cmd_registers AS INT
DECLARE @cmd_events AS INT
DECLARE @cmd_set_clock AS INT
DECLARE @cmd_eob AS INT

DECLARE @password AS VARCHAR(32)
DECLARE @app_log_level AS INT

DECLARE @address AS INT
DECLARE @link_log_level AS INT
DECLARE @ph_conn_tout AS INT
DECLARE @retries AS INT
DECLARE @tr AS INT

-- ==================================================
-- Asignacion de variables
-- ==================================================

SET @brand = 'ELSTER'
SET @model = 'A3'
SET @version = '1.0'
SET @app_proto_descr = 'ANSI-ABB'
SET @phy_proto_descr = 'TCP/IP'

SET @app_proto_id = (SELECT proto_id FROM m_app_protos WHERE descr = @app_proto_descr)
SET @phy_proto_id = (SELECT proto_id FROM m_phy_protos WHERE description = @phy_proto_descr)

SET @cmd_profile = 1
SET @cmd_registers = 2
SET @cmd_events = 3
SET @cmd_set_clock = 4
SET @cmd_eob = 5

SET @password='00000000'
SET @app_log_level = 255

SET @address = 1
SET @link_log_level = 255
SET @ph_conn_tout = 5000
SET @retries = 3
SET @tr = 100

-- ==================================================
-- Ejecucion del script
-- ==================================================



/* -- Tabla: m_meters_brands */
INSERT INTO 
[m_meters_brands] ([brand],[model],[version],[def_app_proto],[def_phy_proto]) VALUES (@brand, @model, @version, @app_proto_id, @phy_proto_id)

/* -- Tabla: m_brands_commands */
SET @brand_id = (SELECT [brand_id] FROM [m_meters_brands] WHERE [brand] = @brand AND [model] = @model )
INSERT INTO [m_brands_commands] VALUES (@cmd_profile,  @brand_id) /* PROFILE   */
INSERT INTO [m_brands_commands] VALUES (@cmd_registers,@brand_id) /* REGISTERS */
INSERT INTO [m_brands_commands] VALUES (@cmd_events,   @brand_id) /* EVENTS    */
INSERT INTO [m_brands_commands] VALUES (@cmd_set_clock,@brand_id) /* SET CLOCK */
INSERT INTO [m_brands_commands] VALUES (@cmd_eob,      @brand_id) /* EOB       */

/* -- Tabla: m_meters_template */
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'password',                    @password,                    @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'app',  'log_level',                   @app_log_level,               @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'address',                     @address,                     @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'log_level',                   @link_log_level,              @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'ph_conn_tout',                @ph_conn_tout,                @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'retries',                     @retries,                     @brand_id) 
INSERT INTO [dbo].[m_meters_templates] ([proto_id], [type], [parameter], [value], [brand_id]) VALUES ( @app_proto_id, 'link', 'tr',                          @tr,                          @brand_id) 


DECLARE @brand_Landis AS VARCHAR(32)
DECLARE @brand_Hexing AS VARCHAR(32)
DECLARE @model_Landis AS VARCHAR(32)
DECLARE @model_Hexing AS VARCHAR(32)
DECLARE @brand_id_Landis AS INT
DECLARE @brand_id_Hexing AS INT

DECLARE @cmd_profile1 AS INT
DECLARE @cmd_profile2 AS INT

-- ==================================================
-- Asignacion de variables
-- ==================================================

SET @brand_Hexing = 'Hexing'
SET @model_Hexing = 'HXF300'
SET @brand_Landis = 'Landis'
SET @model_Landis = 'ZMD'

SET @cmd_profile1 = 7
SET @cmd_profile2 = 8

-- ==================================================
-- Ejecucion del script
-- ==================================================

/* -- Tabla: m_brands_commands */
SET @brand_id_Landis = (SELECT [brand_id] FROM [m_meters_brands] WHERE [brand] = @brand_Landis AND [model] = @model_Landis )
SET @brand_id_Hexing = (SELECT [brand_id] FROM [m_meters_brands] WHERE [brand] = @brand_Hexing AND [model] = @model_Hexing )

INSERT INTO [m_brands_commands] VALUES (@cmd_profile1,  @brand_id_Landis) /* PROFILE  1 */
INSERT INTO [m_brands_commands] VALUES (@cmd_profile1,  @brand_id_Hexing) /* PROFILE  1 */
INSERT INTO [m_brands_commands] VALUES (@cmd_profile2,  @brand_id_Hexing) /* PROFILE  2 */

DECLARE
	@A1R_1 int,
	@A1R_2 int
SELECT @A1R_1 = brand_id FROM m_meters_brands WHERE model = 'A1R+1'
SELECT @A1R_2 = brand_id FROM m_meters_brands WHERE model = 'A1R+2'

UPDATE m_meters_brands SET model = 'Alpha I' where brand_id = @A1R_1
UPDATE m_meters_brands SET model = 'Alpha II' where brand_id = @A1R_2

INSERT INTO m_meters_brands (brand,model,version,def_app_proto,def_phy_proto) VALUES ('STAR','DTS27','1.0',9,1)

--Habilitación de comando para perfil de carga 0
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (1,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1))

--Habilitación de comando para registros instantáneos
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (2,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1))

--Habilitación de comando para eventos por fecha 
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (3,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1))

--Habilitación de comando para sincronización horaria 
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (4,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1))

--Habilitación de comando para registros de facturación por fecha 
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (5,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1))

--Habilitación de comando para perfil de carga 1
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (7,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1))


INSERT INTO m_brands_commands (command_id, brand_id) VALUES (8,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1))


--Valores por defecto para la tabla m_app_dlms_data
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_proto_version', N'-1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_context_name', N'1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_auth_choice', N'0', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_auth_value', N'1111111111111111', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_mechanism_name', N'1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'dlms_version', N'6', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'dlms_max_recv_pdu_size', N'0', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'dlms_conformance', N'7805', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'dlms_conformance_legacy_tag', N'0', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'dlms_key_value', N'', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'dlms_use_rlrq', N'1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'log_level', N'255', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'max_days_mtr_events', N'', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_system_title', N'', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_key_authentication', N'', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_key_encryption', N'', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )



--Valores por defecto para la tabla m_link_dlmsip_data
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'ph_conn_tout', N'5000', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'retries', N'3', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'tr', N'100', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'src_port', N'1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'dest_port', N'1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'version', N'1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'log_level', N'255', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) )



update m_task_err_codes set error_desc = 'El puerto no esta operativo en el agente' where error_code = -16
update m_task_err_codes set error_desc = 'El puerto no esta listo en el agente' where error_code = -17
insert into m_task_err_codes (error_code, error_desc) values (-38, 'El hanger contiene mas lineas que las soportadas')
insert into m_task_err_codes (error_code, error_desc) values (-39, 'Fallo la desencriptacion del password')
insert into m_task_err_codes (error_code, error_desc) values (-40, 'El puerto IP no tiene asignados ni IP ni puerto locales')
insert into m_task_err_codes (error_code, error_desc) values (-60, 'El tipo de tarea no esta soportado')
insert into m_task_err_codes (error_code, error_desc) values (-50, 'La tarea se ejecuto parcialmente')
insert into m_task_err_codes (error_code, error_desc) values (-51, 'Error en la conversion')
insert into m_task_err_codes (error_code, error_desc) values (-52, 'No todos los datos se insertaron en la base (archivo PORTABLE)')
insert into m_task_err_codes (error_code, error_desc) values (-53, 'El meter procesado no se encontró en la base o posee un sched_id incorrecto (archivo PORTABLE)')
insert into m_task_err_codes (error_code, error_desc) values (-54, 'El meter procesado posee un brand, model y/o version incorrectos (archivo PORTABLE)')

 INSERT INTO  m_meters 
(sched_id, 
 meter_id, 
 brand_id, 
 tz, 
 phy_proto_id, 
 app_proto_id, 
 log_level, 
 m_enable, 
 tz_id, 
 TU, 
 TP, 
 ami, 
 group_id, 
 master_meter_id, 
 master) 
 VALUES (
 (select case when (select count(*)  from m_schedulers where sched_id <> '-1' and enable =1)> 0 
then (select top 1 sched_id  from m_schedulers where sched_id <> '-1' and enable =1)
else (select top 1 sched_id  from m_schedulers)
end),
 'NO_METER',
 (select brand_id from m_meters_brands where brand = 'NOBRAND' and model = 'NOMODEL'),
 (select top 1 tz from c_tz where tz = -3), 
 (select proto_id from m_phy_protos where description = 'TCP/IP'), 
 1, 
 255, 
 1, 
 (select top 1 tz_id from c_tz where tz = -3), 
 1, 
 1, 

 INSERT INTO m_brands_commands VALUES ((select command_id from m_commands where type= 1 and log = 1 and reg_type = 4),(select brand_id from m_meters_brands where brand = 'ELSTER' and model = 'A3' and version = '1.0'))


INSERT INTO m_brands_commands VALUES ((select command_id from m_commands where type= 1 and log = 2 and reg_type = 4),(select brand_id from m_meters_brands where brand = 'ELSTER' and model = 'A3' and version = '1.0'))


INSERT INTO m_brands_commands VALUES ((select command_id from m_commands where type= 1 and log = 1 and reg_type = 4),(select brand_id from m_meters_brands where brand = 'Actaris' and model = 'ACE6000' and version = '1.0'))


SET IDENTITY_INSERT m_origin ON;
insert into m_origin (origin_id, descr, heft) values (4, 'Lectura Portable', 3);
SET IDENTITY_INSERT m_origin OFF;

