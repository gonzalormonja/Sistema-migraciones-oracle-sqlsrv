insert into s_menu(menu_id,menu_name,menu_desc,menu_icon,menu_color,menu_item_route)
	values((select max(menu_id)+1 from s_menu),'Importación','Importación','icon import-export','orange',
	CONCAT('Configuración&6;Importacion&',(select max(menu_id)+1 from s_menu),';'));
	
insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Importación',1,'icon import-export','Importación',(select menu_id from s_menu where menu_name='Importación'),'orange',
	6,'fg-white','tile');
	
insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values(6,
	(select menu_item_id from s_menu_items where menu_item_name='Importación'),
	1,5);
	
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Importación'),1,1,0,1);
	
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Importación'),1,1,1,1);
	
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Importación'),1,1,2,1);
	
	
	
insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Importación PdM',2,'icon import-export','Importación PdM','puntos_medida_importacion_grid.php','orange',
	(select menu_id from s_menu where menu_name='Importación'),'fg-white','tile');

insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values((select menu_id from s_menu where menu_name='Importación'),
	(select menu_item_id from s_menu_items where menu_item_name='Importación PdM'),
	1,1);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Importación PdM'),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Importación PdM'),1,1,1,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Importación PdM'),1,1,2,1);
	
	
	

	

insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Importación Medidores',2,'icon import-export','Importación Medidores','medidores_importacion_grid.php','orange',
	(select menu_id from s_menu where menu_name='Importación'),'fg-white','tile');

	insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values((select menu_id from s_menu where menu_name='Importación'),
	(select menu_item_id from s_menu_items where menu_item_name='Importación Medidores'),
	1,1);

	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Importación Medidores'),1,1,0,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Importación Medidores'),1,1,1,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Importación Medidores'),1,1,2,1);
	
	
	

	
insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Importación Clientes',2,'icon import-export','Importación Clientes','clientes_importacion_grid.php','orange',
	(select menu_id from s_menu where menu_name='Importación'),'fg-white','tile');

	insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values((select menu_id from s_menu where menu_name='Importación'),
	(select menu_item_id from s_menu_items where menu_item_name='Importación Clientes'),
	1,1);

	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Importación Clientes'),1,1,0,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Importación Clientes'),1,1,1,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Importación Clientes'),1,1,2,1);
	
	update s_menu_items SET menu_item_hlink ='monitor/AMI' WHERE menu_item_name ='Monitor AMI'
update s_menu_items SET menu_item_hlink ='monitor/CI' WHERE menu_item_name ='Monitor C & I'

	update s_menu_items SET menu_item_hlink ='ci/eventos' WHERE menu_item_id = 20

update s_menu_items SET menu_item_hlink ='tou/asignar-tarifas' WHERE menu_item_id = 98


update s_menu_items set menu_item_hlink = 'res/analisis-eventos' where menu_item_id = 82




	insert into s_menu(menu_id,menu_name,menu_desc,menu_icon,menu_color,menu_item_route)
	values((select max(menu_id)+1 from s_menu),'Cubos','Cubos','icon cube','orange',
	CONCAT('Configuración&6;Cubos&',(select max(menu_id)+1 from s_menu),';'));

insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Cubos',2,'icon cube','Cubos',
	'cubo_config.php','orange',
	6,'fg-white','tile');

insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values(6,
	(select menu_item_id from s_menu_items where menu_item_name='Cubos'),
	1,5);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select menu_item_id from s_menu_items where menu_item_name='Cubos'),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select menu_item_id from s_menu_items where menu_item_name='Cubos'),1,1,1,1);
	
	
	
	insert into s_menu(menu_id,menu_name,menu_desc,menu_icon,menu_color,menu_item_route)
	values((select max(menu_id)+1 from s_menu),'Registros y Eventos','Registros y Eventos','icon log-muc','green',
	CONCAT('Herramientas y Servicios&5;Registros y Eventos&',(select max(menu_id)+1 from s_menu),';'));

insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Registros y Eventos',1,'icon log-muc','Registros y Eventos',
	(select max(menu_id) from s_menu),'green', 5,'fg-white','tile');

insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values(5,
	(select menu_item_id from s_menu_items where menu_item_name='Registros y Eventos'),
	1,8);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select menu_item_id from s_menu_items where menu_item_name='Registros y Eventos'),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select menu_item_id from s_menu_items where menu_item_name='Registros y Eventos'),1,1,1,1);



insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,menu_item_hlink,menu_item_bgcolor,
                         menu_id,menu_item_fcolor,menu_item_size)
values((select max(menu_item_id)+1 from s_menu_items),'Registros de Sistema',2,'icon log-muc','Registros de Sistema',
       'monitor_client.php','green', (select menu_id from s_menu where menu_name = 'Registros y Eventos'),'fg-white','tile');

insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
values((select menu_id from s_menu where menu_name = 'Registros y Eventos'),
       (select max(menu_item_id) from s_menu_items),
       1,1);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,1,1);



insert into s_menu (menu_id, menu_name, menu_desc, menu_main, menu_icon, menu_color, menu_item_route)
values ((select max(menu_id) + 1 from s_menu), 'Registros Instantáneos', 'Registros Instantáneos', 0, '', 'yellow', 'C I&3;Registros Instantáneos&25;');

update s_menu_items set menu_item_type = 1, menu_item_hlink = (select max(menu_id) from s_menu) where menu_item_id = (select menu_item_id from s_menu_items where menu_item_hlink = 'regInstantaneos.php?t=2');

insert into s_menu_items(menu_item_id, menu_item_name, menu_item_type, menu_item_icono, menu_item_text, menu_item_hlink, menu_item_bgcolor, menu_id, menu_item_fcolor, menu_item_size)
VALUES((select max(menu_item_id) + 1 from s_menu_items), 'Registros Instantáneos', 2, 'icon instant-records', 'text', 'regInstantaneos.php?t=2', 'yellow', (select max(menu_id) from s_menu), 'fg-white', 'tile');

insert into s_menu_topology(menu_id, menu_item_id, menu_col, menu_order)
values ((select max(menu_id) from s_menu), (select max(menu_item_id) from s_menu_items), 1, 1);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,1,1);


-- Cubo de IR
insert into s_menu_items(menu_item_id, menu_item_name, menu_item_type, menu_item_icono, menu_item_text, menu_item_hlink, menu_item_bgcolor, menu_id, menu_item_fcolor, menu_item_size)
VALUES((select max(menu_item_id) + 1 from s_menu_items), 'Cubo de Registros Instantáneos', 2, 'icon cube', 'text', 'cubo_regInstantaneos.php', 'yellow', (select max(menu_id) from s_menu), 'fg-white', 'tile');

insert into s_menu_topology(menu_id, menu_item_id, menu_col, menu_order)
values ((select max(menu_id) from s_menu), (select max(menu_item_id) from s_menu_items), 1, 1);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,1,1);




-- Registros de Facturacion

insert into s_menu (menu_id, menu_name, menu_desc, menu_main, menu_icon, menu_color, menu_item_route)
values ((select max(menu_id) + 1 from s_menu), 'Registros de Facturación', 'Registros de Facturación', 0, '', 'yellow', 'C I&3;Registros de Facturación&26;');

update s_menu_items set menu_item_type = 1, menu_item_hlink = (select max(menu_id) from s_menu) where menu_item_id = (select menu_item_id from s_menu_items where menu_item_hlink = 'regFacturacion.php?t=2');


insert into s_menu_items(menu_item_id, menu_item_name, menu_item_type, menu_item_icono, menu_item_text, menu_item_hlink, menu_item_bgcolor, menu_id, menu_item_fcolor, menu_item_size)
VALUES((select max(menu_item_id) + 1 from s_menu_items), 'Registros de Facturación', 2, 'icon instant-registration', 'text', 'regFacturacion.php?t=2', 'yellow', (select max(menu_id) from s_menu), 'fg-white', 'tile');

insert into s_menu_topology(menu_id, menu_item_id, menu_col, menu_order)
values ((select max(menu_id) from s_menu), (select max(menu_item_id) from s_menu_items), 1, 1);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,1,1);

-- Cubo de Facturacion


insert into s_menu_items(menu_item_id, menu_item_name, menu_item_type, menu_item_icono, menu_item_text, menu_item_hlink, menu_item_bgcolor, menu_id, menu_item_fcolor, menu_item_size)
VALUES((select max(menu_item_id) + 1 from s_menu_items), 'Cubo de Registros de Facturación', 2, 'icon cube', 'text', 'cubo_regFacturacion.php', 'yellow', (select max(menu_id) from s_menu), 'fg-white', 'tile');

insert into s_menu_topology(menu_id, menu_item_id, menu_col, menu_order)
values ((select max(menu_id) from s_menu), (select max(menu_item_id) from s_menu_items), 1, 1);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,1,1);


-- Eventos


insert into s_menu (menu_id, menu_name, menu_desc, menu_main, menu_icon, menu_color, menu_item_route)
values ((select max(menu_id) + 1 from s_menu), 'Eventos', 'Eventos', 0, '', 'yellow', 'C I&3;Eventos&27;');

update s_menu_items set menu_item_type = 1, menu_item_hlink = (select max(menu_id) from s_menu) where menu_item_id = (select menu_item_id from s_menu_items where menu_item_hlink = 'ci/eventos');

insert into s_menu_items(menu_item_id, menu_item_name, menu_item_type, menu_item_icono, menu_item_text, menu_item_hlink, menu_item_bgcolor, menu_id, menu_item_fcolor, menu_item_size)
VALUES((select max(menu_item_id) + 1 from s_menu_items), 'Eventos', 2, 'icon events', 'text', 'ci/eventos', 'yellow', (select max(menu_id) from s_menu), 'fg-white', 'tile');

insert into s_menu_topology(menu_id, menu_item_id, menu_col, menu_order)
values ((select max(menu_id) from s_menu), (select max(menu_item_id) from s_menu_items), 1, 1);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,1,1);

-- Cubo de Eventos


insert into s_menu_items(menu_item_id, menu_item_name, menu_item_type, menu_item_icono, menu_item_text, menu_item_hlink, menu_item_bgcolor, menu_id, menu_item_fcolor, menu_item_size)
VALUES((select max(menu_item_id) + 1 from s_menu_items), 'Cubo de Eventos', 2, 'icon cube', 'text', 'cubo_eventos.php', 'yellow', (select max(menu_id) from s_menu), 'fg-white', 'tile');

insert into s_menu_topology(menu_id, menu_item_id, menu_col, menu_order)
values ((select max(menu_id) from s_menu), (select max(menu_item_id) from s_menu_items), 1, 1);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,1,1);


UPDATE s_menu_items SET menu_item_name = 'Servicios MDC',
                        menu_item_hlink = 'monitor/servicios-mdc',
                        menu_item_text = 'Servicios MDC'
                        where menu_item_hlink = 'monitor_client.php';


insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Grupos de Llamadas',2,'icon group-of-meters','Grupos de Llamadas',
	'grupos_llamada_grid.php','orange', 6,'fg-white','tile');

insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values(6,
	(select menu_item_id from s_menu_items where menu_item_name='Grupos de Llamadas'),
	2,6);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select menu_item_id from s_menu_items where menu_item_name='Grupos de Llamadas'),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select menu_item_id from s_menu_items where menu_item_name='Grupos de Llamadas'),1,1,1,1);

update s_menu_items set menu_item_name = 'Grupos de Medidores', menu_item_text = 'Grupos de Medidores'
where menu_item_id = (select menu_item_id from s_menu_items where menu_item_name = 'Grupos de Llamadas');

	insert into s_menu(menu_id,menu_name,menu_desc,menu_icon,menu_color,menu_item_route)
	values((select max(menu_id)+1 from s_menu),'Base de datos','Base de datos','icon managment-interface','violet',
	CONCAT('Sistema&7;Base de datos&',(select max(menu_id)+1 from s_menu),';'));
	insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,
	menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Base de datos',1,'icon managment-interface','text',
	(select menu_id from s_menu where menu_name='Base de datos'),'violet',
	7,'fg-white','tile');

	insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values(7,
	(select menu_item_id from s_menu_items where menu_item_name='Base de datos'),
	2,5);

	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Base de datos'),1,1,0,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Base de datos'),1,1,1,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Base de datos'),1,1,2,1);
	insert into s_menu(menu_id,menu_name,menu_desc,menu_icon,menu_color,menu_item_route)
	values((select max(menu_id)+1 from s_menu),'P historico','Pasaje a hist&oacute;ricos',
	'icon managment-interface','violet',CONCAT((SELECT menu_item_route from s_menu where menu_name='Base de datos'),
	'Pasaje a historicos&'
	,(select max(menu_id)+1 from s_menu),';'));
insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,
	menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Pasaje a Hist&oacute;ricos',1,'icon managment-interface','text',
	(select menu_id from s_menu where menu_name='P historico'),'violet',
	(select menu_id from s_menu where menu_name='Base de datos'),'fg-white','tile');


	insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values((select menu_id from s_menu where menu_name='Base de datos'),
	(select menu_item_id from s_menu_items where menu_item_name='Pasaje a Hist&oacute;ricos'),
	1,1);

	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Pasaje a Hist&oacute;ricos'),1,1,0,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Pasaje a Hist&oacute;ricos'),1,1,1,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Pasaje a Hist&oacute;ricos'),1,1,2,1);
insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,
	menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Destino',2,'icon managment-interface','Destino',
	'destino_form.php','violet',
	(select menu_id from s_menu where menu_name='P historico'),'fg-white','tile');

	insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values((select menu_id from s_menu where menu_name='P historico'),
	(select menu_item_id from s_menu_items where menu_item_name='Destino'),
	1,1);

	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Destino'),1,1,0,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Destino'),1,1,1,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Destino'),1,1,2,1);
	


insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,
	menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Pasaje manual',2,'icon import-export','Pasaje manual',
	'pasaje_historico_form.php','violet',
	(select menu_id from s_menu where menu_name='P historico'),'fg-white','tile');

	insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values((select menu_id from s_menu where menu_name='P historico'),
	(select menu_item_id from s_menu_items where menu_item_name='Pasaje manual'),
	1,1);

	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Pasaje manual'),1,1,0,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Pasaje manual'),1,1,1,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Pasaje manual'),1,1,2,1);

insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Registros de Llamadas',2,'icon log-muc','Registros de Llamadas',
	'registros-de-llamadas.php','green', (select menu_id from s_menu where menu_name = 'Registros y Eventos'),'fg-white','tile');

insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values((select menu_id from s_menu where menu_name = 'Registros y Eventos'),
	(select max(menu_item_id) from s_menu_items),
	1,1);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,1,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,2,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,3,1);

UPDATE s_menu_items SET menu_item_hlink = 'monitor/registros-de-llamadas'
WHERE menu_item_hlink = 'registros-de-llamadas.php';

UPDATE s_menu_items SET menu_item_name = 'Exportación de PRN'
                        where menu_item_hlink = 'transf_datos.php';
update S_MENU_ITEMS set menu_item_hlink = 'cubo_perfil.php' where menu_item_name = 'Cubo Perfil';



insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,
	menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Pasaje programado',2,'icon managment-interface','Pasaje programado',
	'pasaje_programado_grid.php','violet',
	(select menu_id from s_menu where menu_name='P historico'),'fg-white','tile');

	insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values((select menu_id from s_menu where menu_name='P historico'),
	(select menu_item_id from s_menu_items where menu_item_name='Pasaje programado'),
	1,1);

	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Pasaje programado'),1,1,0,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Pasaje programado'),1,1,1,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Pasaje programado'),1,1,2,1);


insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,menu_item_hlink,menu_item_bgcolor,
    menu_id,menu_item_fcolor,menu_item_size)
    values((select max(menu_item_id)+1 from s_menu_items),'Programas de Auditoria',2,'icon log-muc','Programas de Auditoria',
    'programas_auditoria_grid.php','green', (select menu_id from s_menu where menu_name = 'Auditoría'),'fg-white','tile');

insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
    values((select menu_id from s_menu where menu_name = 'Auditoría'),
    (select max(menu_item_id) from s_menu_items),
    2,4);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,1,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,2,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,3,1);



insert into s_audit_programs (name) values ('Default');


insert into s_audit_modules (name, module_type) values ('User login', 'System');
insert into s_audit_modules (name, module_type) values ('User logout', 'System');
insert into s_audit_modules (name, module_type) values ('ABM Tareas Programadas', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Tareas Programadas por Grupo', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Clientes', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Medidores', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Puntos de Medida', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Reportes Programados', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Descripcion de Usuario', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Grupos de Puntos de Medida', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Medidores Virtuales', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Campos Adicionales', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Usuarios', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Roles', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Programas de Auditoria', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Concentradores', 'Transaction');
insert into s_audit_modules (name, module_type) values ('ABM Puertos', 'Transaction');

insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'User login'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'User logout'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Tareas Programadas'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Tareas Programadas por Grupo'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Clientes'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Medidores'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Puntos de Medida'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Reportes Programados'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Descripcion de Usuario'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Grupos de Puntos de Medida'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Medidores Virtuales'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Campos Adicionales'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Usuarios'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Roles'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Programas de Auditoria'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Concentradores'));
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Puertos'));
	
	
	

insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,
	menu_item_hlink,menu_item_bgcolor,
	menu_id,menu_item_fcolor,menu_item_size)
	values((select max(menu_item_id)+1 from s_menu_items),'Listado',2,'icon managment-interface','Listado',
	'pasaje_historico_grid.php','violet',
	(select menu_id from s_menu where menu_name='P historico'),'fg-white','tile');

	insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
	values((select menu_id from s_menu where menu_name='P historico'),
	(select menu_item_id from s_menu_items where menu_item_name='Listado'),
	1,1);

	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Listado'),1,1,0,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Listado'),1,1,1,1);
	insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
	values((select menu_item_id from s_menu_items where menu_item_name='Listado'),1,1,2,1);
	
	
	insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,menu_item_hlink,menu_item_bgcolor,
    menu_id,menu_item_fcolor,menu_item_size)
    values((select max(menu_item_id)+1 from s_menu_items),'Reportes de Auditoria',2,'icon log-muc','Reportes de Auditoria',
    'reportes_auditoria.php','green', (select menu_id from s_menu where menu_name = 'Auditoría'),'fg-white','tile');

insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
    values((select menu_id from s_menu where menu_name = 'Auditoría'),
    (select max(menu_item_id) from s_menu_items),
    2,4);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,1,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,2,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,3,1);
	
	
	insert into s_audit_modules (name, module_type) values ('ABM Schedulers', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Schedulers'));
insert into s_audit_modules (name, module_type) values ('ABM Hangers', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Hangers'));
insert into s_audit_modules (name, module_type) values ('ABM Discadores', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Discadores'));
insert into s_audit_modules (name, module_type) values ('ABM Grupos', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Grupos'));
insert into s_audit_modules (name, module_type) values ('ABM Shares', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Shares'));
insert into s_audit_modules (name, module_type) values ('ABM Empresas', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Empresas'));
insert into s_audit_modules (name, module_type) values ('ABM Agentes', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Agentes'));
insert into s_audit_modules (name, module_type) values ('Generacion de Estimaciones', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'Generacion de Estimaciones'));
insert into s_audit_modules (name, module_type) values ('Recalculo KE', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'Recalculo KE'));
insert into s_audit_modules (name, module_type) values ('ABM Eventos/Alarmas', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Eventos/Alarmas'));
insert into s_audit_modules (name, module_type) values ('Descripcion de Evento', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'Descripcion de Evento'));
insert into s_audit_modules (name, module_type) values ('ABM Canales de Perfil', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Canales de Perfil'));
insert into s_audit_modules (name, module_type) values ('ABM Unidad de Usuario', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Unidad de Usuario'));
insert into s_audit_modules (name, module_type) values ('ABM Anomalias', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Anomalias'));
insert into s_audit_modules (name, module_type) values ('ABM Magnitudes de Anomalias', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Magnitudes de Anomalias'));
insert into s_audit_modules (name, module_type) values ('ABM Desempaquetadores', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Desempaquetadores'));
insert into s_audit_modules (name, module_type) values ('ABM Configuracion de Reportes', 'Transaction');
insert into s_audit_programs_modules (program_id, module_id)
    values ((select id from s_audit_programs where name LIKE 'Default'), (select id from s_audit_modules where name LIKE 'ABM Configuracion de Reportes'));
	
UPDATE s_menu_items SET menu_item_name = 'Grupos de Medidores' WHERE menu_item_id = (SELECT menu_item_id FROM s_menu_items WHERE menu_item_name LIKE 'Grupos De Llamadas');

update s_menu_items set menu_item_name='Historial',menu_item_text='Historial' where menu_item_name='Listado';

update s_menu_items set menu_item_name = 'Grupos de Puntos de Medida' where menu_item_name = 'Grupos de Punto de Medida';

update s_audit_log set action = 'alta' where action = 'insert';
update s_audit_log set action = 'baja' where action = 'delete';
update s_audit_log set action = 'modificacion' where action = 'update';
update s_audit_log set action = 'activacion' where action = 'enable';
update s_audit_log set action = 'desactivacion' where action = 'disable';

update s_menu SET menu_item_route = CONCAT('CI&3;Registros Instantáneos&',(SELECT menu_id from s_menu where menu_name = 'Registros Instantáneos'), ';') where menu_name = 'Registros Instantáneos';
update s_menu SET menu_item_route = CONCAT('CI&3;Registros de Facturación&', (SELECT menu_id from s_menu where menu_name = 'Registros de Facturación'), ';') where menu_name = 'Registros de Facturación';

insert into s_menu_items(menu_item_id,menu_item_name,menu_item_type,menu_item_icono,menu_item_text,menu_item_hlink,menu_item_bgcolor,
    menu_id,menu_item_fcolor,menu_item_size)
    values((select max(menu_item_id)+1 from s_menu_items),'Lecturas Portables',2,'icon log-muc','Lecturas Portables',
    'importacion_lecturas_portables.php','green', (select menu_id from s_menu where menu_name = 'Import / Export de Datos'),'fg-white','tile');

insert into s_menu_topology(menu_id,menu_item_id,menu_col,menu_order)
    values((select menu_id from s_menu where menu_name = 'Import / Export de Datos'),
    (select max(menu_item_id) from s_menu_items),
    2,4);

insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,0,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,1,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,2,1);
insert into s_rol_menu(menu_item_id,item_visible,item_permission,rol_id,permission)
values((select max(menu_item_id) from s_menu_items),1,1,3,1);

INSERT INTO migrations(migration,batch)values(CONCAT('insersion_de_script_','Insert2.sql'),1);
