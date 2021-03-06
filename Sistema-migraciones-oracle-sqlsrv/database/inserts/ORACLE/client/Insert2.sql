
DECLARE

v_brand VARCHAR(32);
v_model VARCHAR(32);
v_version VARCHAR(32);
v_app_proto_descr VARCHAR(32);
v_phy_proto_descr VARCHAR(32);
v_password  VARCHAR(32);
v_app_proto_id NUMBER(10,0);
v_phy_proto_id NUMBER(10,0);
v_brand_id NUMBER(10,0);

v_cmd_profile NUMBER(10,0);
v_cmd_registers NUMBER(10,0);
v_cmd_events NUMBER(10,0);
v_cmd_set_clock NUMBER(10,0);
v_cmd_eob NUMBER(10,0);


v_acse_auth_choice NUMBER(10,0);
v_acse_auth_value VARCHAR(32);
v_acse_context_name NUMBER(10,0);
v_acse_mechanism_name NUMBER(10,0);
v_acse_proto_version NUMBER(10,0);
v_dlms_conformance NUMBER(10,0);
v_dlms_conformance_legacy_tag NUMBER(10,0);
v_dlms_key_value VARCHAR(32);
v_dlms_max_recv_pdu_size NUMBER(10,0);
v_dlms_use_rlrq NUMBER(10,0);
v_dlms_version NUMBER(10,0);
v_app_log_level NUMBER(10,0);
v_link_log_level NUMBER(10,0);

v_dest_addr_len NUMBER(10,0);
v_dest_addr_lower NUMBER(10,0);
v_dest_addr_upper NUMBER(10,0);
v_len_rx NUMBER(10,0);
v_len_tx NUMBER(10,0);
v_neg_i_len NUMBER(10,0);
v_ph_conn_tout NUMBER(10,0);
v_retries NUMBER(10,0);
v_src_addr_len NUMBER(10,0);
v_src_addr_lower NUMBER(10,0);
v_src_addr_upper NUMBER(10,0);
v_tp NUMBER(10,0);
v_tr NUMBER(10,0);
v_w_rx NUMBER(10,0);
v_w_tx NUMBER(10,0);

-- ==================================================
-- Asignacion de variables
-- ==================================================

BEGIN

v_brand := 'ELGAMA';
v_model := 'Gama300';
v_version := '1.0';
v_app_proto_descr := 'xDLMS/COSEM/HDLC';
v_phy_proto_descr := 'TCP/IP';
v_password := ' ';
SELECT proto_id INTO v_app_proto_id  FROM m_app_protos WHERE descr = v_app_proto_descr;
SELECT proto_id INTO v_phy_proto_id FROM m_phy_protos WHERE description = v_phy_proto_descr;

v_cmd_profile := 1;
v_cmd_registers := 2;
v_cmd_events := 3;
v_cmd_set_clock := 4;
v_cmd_eob := 5;

v_acse_auth_choice := 0;
v_acse_auth_value:=' ';
v_acse_context_name := 2;
v_acse_mechanism_name := 1;
v_acse_proto_version := -1;
v_dlms_conformance := 1841952;
v_dlms_conformance_legacy_tag := 0;
v_dlms_key_value := ' ';
v_dlms_max_recv_pdu_size := 0;
v_dlms_use_rlrq := 1;
v_dlms_version := 6;
v_app_log_level := 255;

v_dest_addr_len := 4;
v_dest_addr_lower := 0;
v_dest_addr_upper := 1;
v_len_rx := 128;
v_len_tx := 128;
v_link_log_level := 255;
v_neg_i_len := 1;
v_ph_conn_tout := 5000;
v_retries := 5;
v_src_addr_len := 1;
v_src_addr_lower := 0;
v_src_addr_upper := 32;
v_tp := 150;
v_tr := 150;
v_w_rx := 7;
v_w_tx := 2;

-- ==================================================
-- Ejecucion del script
-- ==================================================

/* -- Tabla: m_meters_brands */
INSERT INTO m_meters_brands (brand, model, version, def_app_proto, def_phy_proto) VALUES (v_brand, v_model, v_version, v_app_proto_id, v_phy_proto_id);

/* -- Tabla: m_brands_commands */
SELECT brand_id INTO v_brand_id FROM m_meters_brands WHERE brand = v_brand AND model = v_model;
INSERT INTO m_brands_commands VALUES (v_cmd_profile,   v_brand_id); /* PROFILE   */
INSERT INTO m_brands_commands VALUES (v_cmd_registers, v_brand_id); /* REGISTERS */
INSERT INTO m_brands_commands VALUES (v_cmd_events,    v_brand_id); /* EVENTS    */
INSERT INTO m_brands_commands VALUES (v_cmd_set_clock, v_brand_id); /* SET CLOCK */
INSERT INTO m_brands_commands VALUES (v_cmd_eob,       v_brand_id); /* EOB       */

/* -- Tabla: m_meters_template */
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_auth_choice',            v_acse_auth_choice,            v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_auth_value',             v_acse_auth_value,             v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_context_name',           v_acse_context_name,           v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_mechanism_name',         v_acse_mechanism_name,         v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_proto_version',          v_acse_proto_version,          v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_conformance',            v_dlms_conformance,            v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_conformance_legacy_tag', v_dlms_conformance_legacy_tag, v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_key_value',              v_dlms_key_value,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_max_recv_pdu_size',      v_dlms_max_recv_pdu_size,      v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_use_rlrq',               v_dlms_use_rlrq,               v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_version',                v_dlms_version,                v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'log_level',                   v_app_log_level,               v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'dest_addr_len',               v_dest_addr_len,               v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'dest_addr_lower',             v_dest_addr_lower,             v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'dest_addr_upper',             v_dest_addr_upper,             v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'len_rx',                      v_len_rx,                      v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'len_tx',                      v_len_tx,                      v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'log_level',                   v_link_log_level,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'neg_i_len',                   v_neg_i_len,                   v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'ph_conn_tout',                v_ph_conn_tout,                v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'retries',                     v_retries,                     v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'src_addr_len',                v_src_addr_len,                v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'src_addr_lower',              v_src_addr_lower,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'src_addr_upper',              v_src_addr_upper,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'tp',                          v_tp,                          v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'tr',                          v_tr,                          v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'w_rx',                        v_w_rx,                        v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'w_tx',                        v_w_tx,                        v_brand_id); 

END;

/*cortoScript*/

INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (100 ,'VERIFY_METER_SUPPORT' , 'Verifica que el brand, model y version esten soportados');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (101 ,'CONNECT' , 'Establecimiento de conexion con el medidor');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (102 ,'PRE_INIT' , 'Preinicializacion (solo DLMS)');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (103 ,'INIT' , 'Inicialilizacion');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (104 ,'TERM' , 'Deinicializacion');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (105 ,'DISCONNECT' , 'Finalizacion de la conexion con el medidor');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (106, 'STAGE_METER_LOOK_UP' , 'Busqueda de medidor en daisy chain');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (1,   'GET_PROFILE' , 'Lectura perfil log 0');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (11,  'GET_PROFILE1' , 'Lectura perfil log 1');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (12,  'GET_PROFILE2' , 'Lectura perfil log 2');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (2,   'GET_REGISTERS' , 'Lectura de registros instantaneos');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (3,   'GET_EVENTS' , 'Lectura de eventos');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (4,   'SET_CLOCK' , 'Seteo de clock');
INSERT INTO m_call_stages (stage_id,stage_name,stage_descr) VALUES (5,   'GET_EOB' , 'Lectura de EOB');


INSERT INTO d_cube_config (main_filter, max_reg_gen, max_from_gen, day_exec_time, max_reg_day_exec, max_saving_reg, prompt_wait_time, max_reg_render) VALUES ('profile', 5000000, '6M', '22:00', 1000000, 10000000, '1m', 5000000);
INSERT INTO d_cube_config (main_filter, max_reg_gen, max_from_gen, day_exec_time, max_reg_day_exec, max_saving_reg, prompt_wait_time, max_reg_render) VALUES ('IR', 5000000, '6M', '02:00', 1000000, 10000000, '1m', 5000000);
INSERT INTO d_cube_config (main_filter, max_reg_gen, max_from_gen, day_exec_time, max_reg_day_exec, max_saving_reg, prompt_wait_time, max_reg_render) VALUES ('EOB', 5000000, '6M', '04:00', 1000000, 10000000, '1m', 5000000);
INSERT INTO d_cube_config (main_filter, max_reg_gen, max_from_gen, day_exec_time, max_reg_day_exec, max_saving_reg, prompt_wait_time, max_reg_render) VALUES ('event', 5000000, '6M', '06:00', 1000000, 10000000, '1m', 5000000);


update m_meters_templates set value = -1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'acse_proto_version';
update m_meters_templates set value = 2 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'acse_context_name';
update m_meters_templates set value = 0 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'acse_auth_choice';
update m_meters_templates set value = 1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'acse_mechanism_name';
update m_meters_templates set value = 6 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_version';
update m_meters_templates set value = 0 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_max_recv_pdu_size';
update m_meters_templates set value = 1841952 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_conformance';
update m_meters_templates set value = 0 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_conformance_legacy_tag';
update m_meters_templates set value = 1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_use_rlrq';
update m_meters_templates set value = 255 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'app' and parameter = 'log_level';

update m_meters_templates set value = -1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'acse_proto_version';
update m_meters_templates set value = 2 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'acse_context_name';
update m_meters_templates set value = 0 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'acse_auth_choice';
update m_meters_templates set value = 1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'acse_mechanism_name';
update m_meters_templates set value = 6 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_version';
update m_meters_templates set value = 0 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_max_recv_pdu_size';
update m_meters_templates set value = 1841952 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_conformance';
update m_meters_templates set value = 0 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_conformance_legacy_tag';
update m_meters_templates set value = 1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and parameter = 'dlms_use_rlrq';
update m_meters_templates set value = 255 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'app' and parameter = 'log_level';
update m_meters_templates set value = 1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'neg_i_len';
update m_meters_templates set value = 5000 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'ph_conn_tout';
update m_meters_templates set value = 128 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'len_rx';
update m_meters_templates set value = 128 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'len_tx';
update m_meters_templates set value = 7 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'w_rx';
update m_meters_templates set value = 2 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'w_tx';
update m_meters_templates set value = 5 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'retries';
update m_meters_templates set value = 150 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'tp';
update m_meters_templates set value = 150 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'tr';
update m_meters_templates set value = 1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'src_addr_len';
update m_meters_templates set value = 0 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'src_addr_lower';
update m_meters_templates set value = 32 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'src_addr_upper';
update m_meters_templates set value = 4 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'dest_addr_len';
update m_meters_templates set value = 9752 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'dest_addr_lower';
update m_meters_templates set value = 1 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'dest_addr_upper';
update m_meters_templates set value = 255 where brand_id = (select brand_id from m_meters_brands where brand = 'ELGAMA' and model = 'Gama300') and type = 'link' and parameter = 'log_level';

INSERT INTO m_unesa (brand_unesa, model_unesa, brand, model) values (' Q','GD','Circutor','Contador');

UPDATE m_unesa SET model = 'Supervisor' WHERE model_unesa = 'KX';

DECLARE
	ProtoId NUMBER;
	BrandId NUMBER;
BEGIN
	SELECT proto_id
		INTO ProtoId
		FROM m_app_protos
		WHERE descr = 'xDLMS/COSEM/IP';
	SELECT brand_id
		INTO BrandId
		FROM m_meters_brands
		WHERE brand = 'Actaris';

	DELETE m_meters_templates where proto_id = ProtoId and type = 'app' and parameter = 'acse_auth_choice' and value = '0' and brand_id = BrandId;

    DELETE m_meters_templates where proto_id = ProtoId and type = 'app' and parameter = 'acse_auth_value' and value = 'ABCDEFGH' and brand_id = BrandId;
    
    DELETE m_meters_templates where proto_id = ProtoId and type = 'app' and parameter = 'acse_context_name' and value = '1' and brand_id = BrandId;
    
    DELETE m_meters_templates where proto_id = ProtoId and type = 'app' and parameter = 'acse_mechanism_name' and value = '1' and brand_id = BrandId;
    
    DELETE m_meters_templates where proto_id = ProtoId and type = 'app' and parameter = 'acse_proto_version' and value = '1' and brand_id = BrandId;
    
    DELETE m_meters_templates where proto_id = ProtoId and type = 'app' and parameter = 'dlms_conformance' and value = '4125' and brand_id = BrandId;
    
    DELETE m_meters_templates where proto_id = ProtoId and type = 'app' and parameter = 'dlms_conformance_legacy_tag' and value = '0' and brand_id = BrandId;
    
    DELETE m_meters_templates where proto_id = ProtoId and type = 'app' and parameter = 'dlms_key_value' and (value = '' or value is null) and brand_id = BrandId;
    
    DELETE m_meters_templates where proto_id = ProtoId and type = 'app' and parameter = 'dlms_max_recv_pdu_size' and value = '0' and brand_id = BrandId;
    
    DELETE m_meters_templates where proto_id = ProtoId and type = 'app' and parameter = 'dlms_use_rlrq' and value = '1' and brand_id = BrandId;
    
    DELETE m_meters_templates where proto_id = ProtoId and type = 'app' and parameter = 'dlms_version' and value = '6' and brand_id = BrandId;
    
    DELETE m_meters_templates where proto_id = ProtoId and type = 'app' and parameter = 'log_level' and value = '255' and brand_id = BrandId;
    
    COMMIT;
    
   INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id)	VALUES (ProtoId, 'app', 'acse_auth_choice', '0', BrandId);

	INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id)	VALUES (ProtoId, 'app', 'acse_auth_value', 'ABCDEFGH', BrandId);

	INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id)	VALUES (ProtoId, 'app', 'acse_context_name', '1', BrandId);

	INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id)	VALUES (ProtoId, 'app', 'acse_mechanism_name', '1', BrandId);

	INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id)	VALUES (ProtoId, 'app', 'acse_proto_version', '1', BrandId);

	INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id)	VALUES (ProtoId, 'app', 'dlms_conformance', '4125', BrandId);

	INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id)	VALUES (ProtoId, 'app', 'dlms_conformance_legacy_tag', '0', BrandId);

	INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id)	VALUES (ProtoId, 'app', 'dlms_key_value', '', BrandId);

	INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id)	VALUES (ProtoId, 'app', 'dlms_max_recv_pdu_size', '0', BrandId);

	INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id)	VALUES (ProtoId, 'app', 'dlms_use_rlrq', '1', BrandId);

	INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id)	VALUES (ProtoId, 'app', 'dlms_version', '6', BrandId);

	INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id)	VALUES (ProtoId, 'app', 'log_level', '255', BrandId);
    
    COMMIT;
END;

insert into m_meters_templates values(
(SELECT proto_id from m_app_protos where descr='ABB'),
'abb',
'password',
'00000000',
(SELECT brand_id from m_meters_brands where brand='ELSTER' AND model='A1800')
);


DECLARE

v_brand VARCHAR(32);
v_model VARCHAR(32);
v_version VARCHAR(32);
v_app_proto_descr VARCHAR(32);
v_phy_proto_descr VARCHAR(32);
v_password  VARCHAR(32);
v_app_proto_id NUMBER(10,0);
v_phy_proto_id NUMBER(10,0);
v_brand_id NUMBER(10,0);

v_cmd_profile NUMBER(10,0);
v_cmd_registers NUMBER(10,0);
v_cmd_events NUMBER(10,0);
v_cmd_set_clock NUMBER(10,0);
v_cmd_eob NUMBER(10,0);


v_acse_auth_choice NUMBER(10,0);
v_acse_auth_value VARCHAR(32);
v_acse_context_name NUMBER(10,0);
v_acse_mechanism_name NUMBER(10,0);
v_acse_proto_version NUMBER(10,0);
v_dlms_conformance NUMBER(10,0);
v_dlms_conformance_legacy_tag NUMBER(10,0);
v_dlms_key_value VARCHAR(32);
v_dlms_max_recv_pdu_size NUMBER(10,0);
v_dlms_use_rlrq NUMBER(10,0);
v_dlms_version NUMBER(10,0);
v_app_log_level NUMBER(10,0);
v_link_log_level NUMBER(10,0);

v_dest_addr_len NUMBER(10,0);
v_dest_addr_lower NUMBER(10,0);
v_dest_addr_upper NUMBER(10,0);
v_len_rx NUMBER(10,0);
v_len_tx NUMBER(10,0);
v_neg_i_len NUMBER(10,0);
v_ph_conn_tout NUMBER(10,0);
v_retries NUMBER(10,0);
v_src_addr_len NUMBER(10,0);
v_src_addr_lower NUMBER(10,0);
v_src_addr_upper NUMBER(10,0);
v_tp NUMBER(10,0);
v_tr NUMBER(10,0);
v_w_rx NUMBER(10,0);
v_w_tx NUMBER(10,0);

-- ==================================================
-- Asignacion de variables
-- ==================================================

BEGIN

v_brand := 'Hexing';
v_model := 'HXF300';
v_version := '1.0';
v_app_proto_descr := 'xDLMS/COSEM/HDLC';
v_phy_proto_descr := 'TCP/IP';
v_password := '00000000';
SELECT proto_id INTO v_app_proto_id  FROM m_app_protos WHERE descr = v_app_proto_descr;
SELECT proto_id INTO v_phy_proto_id FROM m_phy_protos WHERE description = v_phy_proto_descr;

v_cmd_profile := 1;
v_cmd_registers := 2;
v_cmd_events := 3;
v_cmd_set_clock := 4;
v_cmd_eob := 5;

v_acse_auth_choice := 0;
v_acse_auth_value:='00000000';
v_acse_context_name := 1;
v_acse_mechanism_name := 1;
v_acse_proto_version := 1;
v_dlms_conformance := 32287;
v_dlms_conformance_legacy_tag := 0;
v_dlms_key_value := ' ';
v_dlms_max_recv_pdu_size := 65535;
v_dlms_use_rlrq := 1;
v_dlms_version := 6;
v_app_log_level := 255;

v_dest_addr_len := 1;
v_dest_addr_lower := 1;
v_dest_addr_upper := 0;
v_len_rx := 128;
v_len_tx := 128;
v_link_log_level := 255;
v_neg_i_len := 1;
v_ph_conn_tout := 5000;
v_retries := 5;
v_src_addr_len := 1;
v_src_addr_lower := 0;
v_src_addr_upper := 1;
v_tp := 150;
v_tr := 150;
v_w_rx := 7;
v_w_tx := 2;

-- ==================================================
-- Ejecucion del script
-- ==================================================

/* -- Tabla: m_meters_brands */
INSERT INTO m_meters_brands (brand, model, version, def_app_proto, def_phy_proto) VALUES (v_brand, v_model, v_version, v_app_proto_id, v_phy_proto_id);

/* -- Tabla: m_brands_commands */
SELECT brand_id INTO v_brand_id FROM m_meters_brands WHERE brand = v_brand AND model = v_model;
INSERT INTO m_brands_commands VALUES (v_cmd_profile,   v_brand_id); /* PROFILE   */
INSERT INTO m_brands_commands VALUES (v_cmd_registers, v_brand_id); /* REGISTERS */
INSERT INTO m_brands_commands VALUES (v_cmd_events,    v_brand_id); /* EVENTS    */
INSERT INTO m_brands_commands VALUES (v_cmd_set_clock, v_brand_id); /* SET CLOCK */
INSERT INTO m_brands_commands VALUES (v_cmd_eob,       v_brand_id); /* EOB       */

/* -- Tabla: m_meters_template */
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_auth_choice',            v_acse_auth_choice,            v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_auth_value',             v_acse_auth_value,             v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_context_name',           v_acse_context_name,           v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_mechanism_name',         v_acse_mechanism_name,         v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_proto_version',          v_acse_proto_version,          v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_conformance',            v_dlms_conformance,            v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_conformance_legacy_tag', v_dlms_conformance_legacy_tag, v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_key_value',              v_dlms_key_value,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_max_recv_pdu_size',      v_dlms_max_recv_pdu_size,      v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_use_rlrq',               v_dlms_use_rlrq,               v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_version',                v_dlms_version,                v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'log_level',                   v_app_log_level,               v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'dest_addr_len',               v_dest_addr_len,               v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'dest_addr_lower',             v_dest_addr_lower,             v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'dest_addr_upper',             v_dest_addr_upper,             v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'len_rx',                      v_len_rx,                      v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'len_tx',                      v_len_tx,                      v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'log_level',                   v_link_log_level,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'neg_i_len',                   v_neg_i_len,                   v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'ph_conn_tout',                v_ph_conn_tout,                v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'retries',                     v_retries,                     v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'src_addr_len',                v_src_addr_len,                v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'src_addr_lower',              v_src_addr_lower,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'src_addr_upper',              v_src_addr_upper,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'tp',                          v_tp,                          v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'tr',                          v_tr,                          v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'w_rx',                        v_w_rx,                        v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'w_tx',                        v_w_tx,                        v_brand_id); 



END;

update r_parameters set CONSULTA = 'select distinct case when d.id_meter_point is null then ''-1'' else d.id_meter_point end codigo_p_medida,case when d.name_meter_point is null then ''-1'' else d.name_meter_point end desc_p_medida from m_location as d inner join m_location_meters a	on d.id_meter_point=a.id_meter_point inner join m_meters b on a.meter_id=b.meter_id inner join m_app_protos c on b.app_proto_id=c.proto_id and descr <> ''PRIME ALLIANCE'' where case when d.group_id is null then -1 else d.group_id end in (${prm_grupos}) union all select ''-100'' codigo_p_medida,''Todos'' desc_p_medida order by codigo_p_medida asc;' where PARAMETER='prm_punto_medida_cli';


DECLARE

v_brand VARCHAR(32);
v_model VARCHAR(32);
v_version VARCHAR(32);
v_app_proto_descr VARCHAR(32);
v_phy_proto_descr VARCHAR(32);
v_password  VARCHAR(32);
v_app_proto_id NUMBER(10,0);
v_phy_proto_id NUMBER(10,0);
v_brand_id NUMBER(10,0);

v_cmd_profile NUMBER(10,0);
v_cmd_registers NUMBER(10,0);
v_cmd_events NUMBER(10,0);
v_cmd_set_clock NUMBER(10,0);
v_cmd_eob NUMBER(10,0);


v_acse_auth_choice NUMBER(10,0);
v_acse_auth_value VARCHAR(32);
v_acse_context_name NUMBER(10,0);
v_acse_mechanism_name NUMBER(10,0);
v_acse_proto_version NUMBER(10,0);
v_dlms_conformance NUMBER(10,0);
v_dlms_conformance_legacy_tag NUMBER(10,0);
v_dlms_key_value VARCHAR(32);
v_dlms_max_recv_pdu_size NUMBER(10,0);
v_dlms_use_rlrq NUMBER(10,0);
v_dlms_version NUMBER(10,0);
v_app_log_level NUMBER(10,0);
v_link_log_level NUMBER(10,0);

v_dest_addr_len NUMBER(10,0);
v_dest_addr_lower NUMBER(10,0);
v_dest_addr_upper NUMBER(10,0);
v_len_rx NUMBER(10,0);
v_len_tx NUMBER(10,0);
v_neg_i_len NUMBER(10,0);
v_ph_conn_tout NUMBER(10,0);
v_retries NUMBER(10,0);
v_src_addr_len NUMBER(10,0);
v_src_addr_lower NUMBER(10,0);
v_src_addr_upper NUMBER(10,0);
v_tp NUMBER(10,0);
v_tr NUMBER(10,0);
v_w_rx NUMBER(10,0);
v_w_tx NUMBER(10,0);

-- ==================================================
-- Asignacion de variables
-- ==================================================

BEGIN

v_brand := 'Actaris';
v_model := 'ACE6000';
v_version := '1.0';
v_app_proto_descr := 'xDLMS/COSEM/HDLC';
v_phy_proto_descr := 'TCP/IP';
v_password := 'ABCDEFGH';
SELECT proto_id INTO v_app_proto_id  FROM m_app_protos WHERE descr = v_app_proto_descr;
SELECT proto_id INTO v_phy_proto_id FROM m_phy_protos WHERE description = v_phy_proto_descr;

v_cmd_profile := 1;
v_cmd_registers := 2;
v_cmd_events := 3;
v_cmd_set_clock := 4;
v_cmd_eob := 5;

v_acse_auth_choice := 0;
v_acse_auth_value:='ABCDEFGH';
v_acse_context_name := 1;
v_acse_mechanism_name := 1;
v_acse_proto_version := 1;
v_dlms_conformance := 4125;
v_dlms_conformance_legacy_tag := 0;
v_dlms_key_value := ' ';
v_dlms_max_recv_pdu_size := 0;
v_dlms_use_rlrq := 1;
v_dlms_version := 6;
v_app_log_level := 255;

v_dest_addr_len := 4;
v_dest_addr_lower := 17;
v_dest_addr_upper := 1;
v_len_rx := 128;
v_len_tx := 128;
v_link_log_level := 255;
v_neg_i_len := 1;
v_ph_conn_tout := 5000;
v_retries := 5;
v_src_addr_len := 1;
v_src_addr_lower := 0;
v_src_addr_upper := 1;
v_tp := 30;
v_tr := 100;
v_w_rx := 7;
v_w_tx := 2;

-- ==================================================
-- Ejecucion del script
-- ==================================================

/* -- Tabla: m_meters_brands */
INSERT INTO m_meters_brands (brand, model, version, def_app_proto, def_phy_proto) VALUES (v_brand, v_model, v_version, v_app_proto_id, v_phy_proto_id);

/* -- Tabla: m_brands_commands */
SELECT brand_id INTO v_brand_id FROM m_meters_brands WHERE brand = v_brand AND model = v_model;
INSERT INTO m_brands_commands VALUES (v_cmd_profile,   v_brand_id); /* PROFILE   */
INSERT INTO m_brands_commands VALUES (v_cmd_registers, v_brand_id); /* REGISTERS */
INSERT INTO m_brands_commands VALUES (v_cmd_events,    v_brand_id); /* EVENTS    */
INSERT INTO m_brands_commands VALUES (v_cmd_set_clock, v_brand_id); /* SET CLOCK */
INSERT INTO m_brands_commands VALUES (v_cmd_eob,       v_brand_id); /* EOB       */

/* -- Tabla: m_meters_template */
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_auth_choice',            v_acse_auth_choice,            v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_auth_value',             v_acse_auth_value,             v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_context_name',           v_acse_context_name,           v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_mechanism_name',         v_acse_mechanism_name,         v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'acse_proto_version',          v_acse_proto_version,          v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_conformance',            v_dlms_conformance,            v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_conformance_legacy_tag', v_dlms_conformance_legacy_tag, v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_key_value',              v_dlms_key_value,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_max_recv_pdu_size',      v_dlms_max_recv_pdu_size,      v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_use_rlrq',               v_dlms_use_rlrq,               v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'dlms_version',                v_dlms_version,                v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'log_level',                   v_app_log_level,               v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'dest_addr_len',               v_dest_addr_len,               v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'dest_addr_lower',             v_dest_addr_lower,             v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'dest_addr_upper',             v_dest_addr_upper,             v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'len_rx',                      v_len_rx,                      v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'len_tx',                      v_len_tx,                      v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'log_level',                   v_link_log_level,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'neg_i_len',                   v_neg_i_len,                   v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'ph_conn_tout',                v_ph_conn_tout,                v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'retries',                     v_retries,                     v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'src_addr_len',                v_src_addr_len,                v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'src_addr_lower',              v_src_addr_lower,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'src_addr_upper',              v_src_addr_upper,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'tp',                          v_tp,                          v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'tr',                          v_tr,                          v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'w_rx',                        v_w_rx,                        v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'w_tx',                        v_w_tx,                        v_brand_id); 



END;

DECLARE

v_brand VARCHAR(32);
v_model VARCHAR(32);
v_version VARCHAR(32);
v_app_proto_descr VARCHAR(32);
v_phy_proto_descr VARCHAR(32);
v_app_proto_id NUMBER(10,0);
v_phy_proto_id NUMBER(10,0);
v_brand_id NUMBER(10,0);

v_cmd_profile NUMBER(10,0);
v_cmd_registers NUMBER(10,0);
v_cmd_events NUMBER(10,0);
v_cmd_set_clock NUMBER(10,0);
v_cmd_eob NUMBER(10,0);

v_password VARCHAR(32);
v_app_log_level NUMBER(10,0);

v_address NUMBER(10,0);
v_link_log_level NUMBER(10,0);
v_ph_conn_tout NUMBER(10,0);
v_retries NUMBER(10,0);
v_tr NUMBER(10,0);

-- ==================================================
-- Asignacion de variables
-- ==================================================

BEGIN

v_brand := 'ELSTER';
v_model := 'A3';
v_version := '1.0';
v_app_proto_descr := 'ANSI-ABB';
v_phy_proto_descr := 'TCP/IP';
SELECT proto_id INTO v_app_proto_id  FROM m_app_protos WHERE descr = v_app_proto_descr;
SELECT proto_id INTO v_phy_proto_id FROM m_phy_protos WHERE description = v_phy_proto_descr;

v_cmd_profile := 1;
v_cmd_registers := 2;
v_cmd_events := 3;
v_cmd_set_clock := 4;
v_cmd_eob := 5;

v_password:='00000000';
v_app_log_level := 255;

v_address := 1;
v_link_log_level := 255;
v_ph_conn_tout := 5000;
v_retries := 3;
v_tr := 100;

-- ==================================================
-- Ejecucion del script
-- ==================================================

/* -- Tabla: m_meters_brands */
INSERT INTO m_meters_brands (brand, model, version, def_app_proto, def_phy_proto) VALUES (v_brand, v_model, v_version, v_app_proto_id, v_phy_proto_id);

/* -- Tabla: m_brands_commands */
SELECT brand_id INTO v_brand_id FROM m_meters_brands WHERE brand = v_brand AND model = v_model;
INSERT INTO m_brands_commands VALUES (v_cmd_profile,   v_brand_id); /* PROFILE   */
INSERT INTO m_brands_commands VALUES (v_cmd_registers, v_brand_id); /* REGISTERS */
INSERT INTO m_brands_commands VALUES (v_cmd_events,    v_brand_id); /* EVENTS    */
INSERT INTO m_brands_commands VALUES (v_cmd_set_clock, v_brand_id); /* SET CLOCK */
INSERT INTO m_brands_commands VALUES (v_cmd_eob,       v_brand_id); /* EOB       */

/* -- Tabla: m_meters_template */
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'password',                    v_password,                    v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'app',  'log_level',                   v_app_log_level,               v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'address',                     v_address,                     v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'log_level',                   v_link_log_level,              v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'ph_conn_tout',                v_ph_conn_tout,                v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'retries',                     v_retries,                     v_brand_id); 
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES ( v_app_proto_id, 'link', 'tr',                          v_tr,                          v_brand_id); 



END;

DECLARE

v_brand_Landis VARCHAR(32);
v_brand_Hexing VARCHAR(32);
v_model_Landis VARCHAR(32);
v_model_Hexing VARCHAR(32);
v_brand_id_Landis NUMBER(10,0);
v_brand_id_Hexing NUMBER(10,0);

v_cmd_profile1 NUMBER(10,0);
v_cmd_profile2 NUMBER(10,0);


-- ==================================================
-- Asignacion de variables
-- ==================================================

BEGIN

v_brand_Hexing := 'Hexing';
v_model_Hexing := 'HXF300';
v_brand_Landis := 'Landis';
v_model_Landis := 'ZMD';

v_cmd_profile1 := 7;
v_cmd_profile2 := 8;

-- ==================================================
-- Ejecucion del script
-- ==================================================

/* -- Tabla: m_brands_commands */
SELECT brand_id INTO v_brand_id_Landis FROM m_meters_brands WHERE brand = v_brand_Landis AND model = v_model_Landis;
SELECT brand_id INTO v_brand_id_Hexing FROM m_meters_brands WHERE brand = v_brand_Hexing AND model = v_model_Hexing;

INSERT INTO m_brands_commands VALUES (v_cmd_profile1,   v_brand_id_Landis); /* PROFILE 1  */
INSERT INTO m_brands_commands VALUES (v_cmd_profile1,   v_brand_id_Hexing); /* PROFILE 1  */
INSERT INTO m_brands_commands VALUES (v_cmd_profile2,   v_brand_id_Hexing); /* PROFILE 2  */


END;

DECLARE
	A1R_1 NUMBER;
	A1R_2 NUMBER;
BEGIN
	SELECT brand_id
		INTO A1R_1
		FROM m_meters_brands
		WHERE model = 'A1R+1';
	SELECT brand_id
		INTO A1R_2
		FROM m_meters_brands
		WHERE model = 'A1R+2';

	UPDATE m_meters_brands SET model = 'Alpha I' where brand_id = A1R_1;
	UPDATE m_meters_brands SET model = 'Alpha II' where brand_id = A1R_2;
END;

INSERT INTO m_meters_brands (brand,model,version,def_app_proto,def_phy_proto) VALUES ('STAR','DTS27','1.0',9,1);

--Habilitación de comando para perfil de carga 0
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (1,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1));

--Habilitación de comando para registros instantáneos
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (2,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1));

--Habilitación de comando para eventos por fecha 
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (3,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1));

--Habilitación de comando para sincronización horaria 
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (4,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1));

--Habilitación de comando para registros de facturación por fecha 
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (5,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1));

--Habilitación de comando para perfil de carga 1
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (7,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1));
INSERT INTO m_brands_commands (command_id, brand_id) VALUES (8,(select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1));

--Valores por defecto para la tabla m_app_dlms_data
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_proto_version', N'-1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_context_name', N'1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_auth_choice', N'0', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_auth_value', N'1111111111111111', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_mechanism_name', N'1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'dlms_version', N'6', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'dlms_max_recv_pdu_size', N'0', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'dlms_conformance', N'7805', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'dlms_conformance_legacy_tag', N'0', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'dlms_key_value', N'', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'dlms_use_rlrq', N'1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'log_level', N'255', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'max_days_mtr_events', N'', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_system_title', N'', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_key_authentication', N'', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'app', N'acse_key_encryption', N'', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );


--Valores por defecto para la tabla m_link_dlmsip_data
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'ph_conn_tout', N'5000', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'retries', N'3', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'tr', N'100', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'src_port', N'1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'dest_port', N'1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'version', N'1', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );
INSERT INTO m_meters_templates (proto_id, type, parameter, value, brand_id) VALUES (9, N'link', N'log_level', N'255', (select brand_id from m_meters_brands where brand = 'STAR' and model = 'DTS27' and version = '1.0' and def_app_proto = 9 and def_phy_proto = 1) );

update m_task_err_codes set error_desc = 'El puerto no esta operativo en el agente' where error_code = -16;
update m_task_err_codes set error_desc = 'El puerto no esta listo en el agente' where error_code = -17;
insert into m_task_err_codes (error_code, error_desc) values (-38, 'El hanger contiene mas lineas que las soportadas');
insert into m_task_err_codes (error_code, error_desc) values (-39, 'Fallo la desencriptacion del password');
insert into m_task_err_codes (error_code, error_desc) values (-40, 'El puerto IP no tiene asignados ni IP ni puerto locales');
insert into m_task_err_codes (error_code, error_desc) values (-60, 'El tipo de tarea no esta soportado');
insert into m_task_err_codes (error_code, error_desc) values (-50, 'La tarea se ejecuto parcialmente');
insert into m_task_err_codes (error_code, error_desc) values (-51, 'Error en la conversion');
insert into m_task_err_codes (error_code, error_desc) values (-52, 'No todos los datos se insertaron en la base (archivo PORTABLE)');
insert into m_task_err_codes (error_code, error_desc) values (-53, 'El meter procesado no se encontró en la base o posee un sched_id incorrecto (archivo PORTABLE)');
insert into m_task_err_codes (error_code, error_desc) values (-54, 'El meter procesado posee un brand, model y/o version incorrectos (archivo PORTABLE)');
insert into m_phy_protos (proto_id, description) values (3, 'Optical');
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
 (select Max(sched_id) from m_schedulers where enable =1),
 'NO_METER',
 (select brand_id from m_meters_brands where brand = 'NOBRAND' and model = 'NOMODEL'),
 (select tz from c_tz where tz = -3 and rownum = 1), 
 (select proto_id from m_phy_protos where description = 'Optical'), 
 1, 
 255, 
 1, 
 (select tz_id from c_tz where tz = -3 and rownum = 1), 
 1, 
 1, 
 0, 
 null, 
 'NO_METER', 
 1);

INSERT INTO m_brands_commands VALUES ((select command_id from m_commands where type= 1 and log = 1 and reg_type = 4),(select brand_id from m_meters_brands where brand = 'ELSTER' and model = 'A3' and version = '1.0'));

INSERT INTO m_brands_commands VALUES ((select command_id from m_commands where type= 1 and log = 2 and reg_type = 4),(select brand_id from m_meters_brands where brand = 'ELSTER' and model = 'A3' and version = '1.0'));

INSERT INTO m_brands_commands VALUES ((select command_id from m_commands where type= 1 and log = 1 and reg_type = 4),(select brand_id from m_meters_brands where brand = 'Actaris' and model = 'ACE6000' and version = '1.0'));


insert into m_origin (origin_id, descr, heft) values (4, 'Lectura Portable', 3);





