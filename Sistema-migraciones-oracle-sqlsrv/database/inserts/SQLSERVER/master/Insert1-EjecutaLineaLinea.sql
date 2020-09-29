--Tabla u_auth_type
insert into u_auth_type values('LOCAL',0,'LOCAL') 
insert into u_auth_type values('LDAP',1,'LDAP')

--Tabla u_authentication
insert into u_authentication values(0,'LOCAL',0,null,null,null,null,null,null,null,null,null,null)

INSERT m_lic_client VALUES (1, 'NO_LICENSE', 1, 'NO_LICENSE', NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL)

INSERT INTO m_clients VALUES (1, 'Client1', 'OPTIMUM', 'OPTIMUM')

--Tabla c_clients
insert into c_clients values(0,'ESG Dilec','Zona I, La Madrid','Rosario','2000','Santa Fe','Argentina','ESG Dilec','info_esg@blcges.com','+54 341 481 7886','0','1',null,null,null,null,null,null,1,null)

--Tabla u_rol
SET IDENTITY_INSERT u_rol ON;
insert into u_rol (rol_name,rol_desc,rol_enable,client_id,rol_id) values('SuperAdmin','Usuario con privilegios Super Admin',1,0,0)
INSERT INTO u_rol (rol_name,rol_desc,rol_enable,client_id,rol_id) VALUES ('Administrador','Administrador',1,0,1)
INSERT INTO u_rol (rol_name,rol_desc,rol_enable,client_id,rol_id) VALUES ('Operador','Operador de info',1,0,2)
INSERT INTO u_rol (rol_name,rol_desc,rol_enable,client_id,rol_id) VALUES ('VISUALIZADOR','Visualizador de info',1,0,3)
SET IDENTITY_INSERT u_rol OFF;
--Tabla u_users
insert into u_users (username, name,email, password, id_auth, rol_id, menu_collapse,menu_fav,change_password) values('SuperAdmin','Super Admin','info_esg@blcges.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',0,0,1,null,0)

--Tabla s_user_groups
insert into s_user_groups (user_id, group_id) values(0,1)

----Tabla s_menu
INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (1, N'Inicio', N'Inicio', 1, N'icon home', NULL, NULL)

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (2, N'Residenciales', N'Residenciales', 1, N'icon residencial', N'red', N'Residenciales&2;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (3, N'C&I', N'C&I', 1, N'icon ci', N'yellow', N'C  I&3;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (4, N'Analítica', N'Área Analítica', 1, N'icon analytic', N'lightBlue', N'Analítica&4;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (5, N'Herramientas y Servicios', N'Herramientas y Servicios', 1, N'icon hys', N'green', N'Herramientas y Servicios&5;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (6, N'Configuración', N'Configuración', 1, N'icon settings', N'orange', N'Configuración&6;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (7, N'Sistema', N'Sistema', 1, N'icon system', N'violet', N'Sistema&7;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (8, N'Perfil', N'Cuenta usuario', NULL, NULL, NULL, N'Perfil&8;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (9, N'Agentes y Puertos', N'Agentes y Puertos', NULL, NULL, NULL, N'Sistema&7;Comunicación&14;Agentes y Puertos&9;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (10, N'Varias', N'Tablas Varias', NULL, NULL, NULL, N'Sistema&7;Tablas Varias&10;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (12, N'Variables', N'Variables', NULL, NULL, NULL, N'Configuración&6;Variables&12;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (13, N'Reportes', N'Reportes', NULL, NULL, NULL, N'Sistema&7;Reportes&13;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (14, N'Comunicaciones', N'Comunicaciones', NULL, NULL, NULL, N'Sistema&7;Comunicación&14;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (15, N'Autenticación', N'Autenticación', NULL, NULL, NULL, N'Sistema&7;Autenticación&15;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (16, N'Eventos', N'Eventos', NULL, NULL, NULL, N'Residenciales&2;Eventos&16;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (17, N'Perfil de Carga', N'Perfil de Carga', NULL, NULL, NULL, N'Residenciales&2;Perfil de Carga&17;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (18, N'Perfil de Carga', N'Perfil de Carga', NULL, NULL, NULL, N'C I&3;Perfil de Carga&18;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (19, N'VEE', N'VEE', NULL, NULL, NULL, N'Herramientas y Servicios&5;VEE&19;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (20, N'TOU', N'TOU', NULL, N'icon measured-points', NULL, N'Configuración&6;TOU&20;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (21, N'Import / Export de Datos', N'Import / Export de Datos', NULL, N'icon import-export', NULL, N'Herramientas y Servicios&5;Import / Export de Datos&21;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (22, N'Auditoría', N'Auditoría', NULL, NULL, NULL, N'Herramientas y Servicios&5;Auditoría&22;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (23, N'Anomalías', N'Anomalías', NULL, NULL, NULL, N'Analítica&4;Anomalías&23;')

INSERT [dbo].[s_menu] ([menu_id], [menu_name], [menu_desc], [menu_main], [menu_icon], [menu_color], [menu_item_route]) VALUES (24, N'Panel de Control', N'Panel de Control', NULL, NULL, NULL, N'Sistema&7;Comunicación&14;Panel de Control&9;')


--Tabla s_menu_items

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (1, N'Residenciales', 1, N'icon residencial', N'text', N'2', N'red', 1, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (2, N'C&I', 1, N'icon ci', N'text', N'3', N'yellow', 1, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (3, N'Analítica', 1, N'icon analytic', N'text', N'4', N'lightBlue', 1, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (4, N'Herramientas y Servicios', 1, N'icon hys', N'text', N'5', N'green', 1, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (5, N'Configuración', 1, N'icon settings', N'text', N'6', N'orange', 1, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (6, N'Sistema', 1, N'icon system', N'text', N'7', N'violet', 1, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (7, N'Registros Instantáneos', 2, N'icon instant-records', N'text', N'regInstantaneos.php', N'red', 2, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (8, N'Reportes', 2, N'icon dynamic-reports', N'text', N'reportes_grid.php', N'red', 2, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (9, N'Eventos', 1, N'icon events', N'text', N'16', N'red', 2, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (10, N'Datos Puntos de Medida', 2, N'icon general-data', N'text', N'datosPuntosMedida.php', N'red', 2, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (11, N'Perfil de Carga', 1, N'icon profile', N'Consulta Perfil', N'17', N'red', 2, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (12, N'Registros de Facturación', 2, N'icon instant-registration', N'text', N'regFacturacion.php', N'red', 2, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (13, N'Topología de Red', 1, N'icon networks-topology', N'text', N'2', N'red', 2, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (14, N'Histórico', 1, N'icon historic', N'text', N'2', N'red', 2, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (15, N'Perfil de Carga', 1, N'icon profile', N'text', N'18', N'yellow', 3, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (16, N'Reportes', 2, N'icon dynamic-reports', N'text', N'reportes_grid.php', N'yellow', 3, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (17, N'Registros Facturación', 2, N'icon instant-registration', N'text', N'regFacturacion.php?t=2', N'yellow', 3, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (18, N'Topología de Red', 1, N'icon networks-topology', N'text', N'3', N'yellow', 3, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (19, N'Histórico', 2, N'icon historic', N'text', N'3', N'yellow', 3, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (20, N'Eventos', 2, N'icon events', N'text', N'eventos.php', N'yellow', 3, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (21, N'Registros Instantáneos', 2, N'icon instant-records', N'text', N'regInstantaneos.php?t=2', N'yellow', 3, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (22, N'Monitor C & I', 2, N'icon control-panel', N'text', N'MonitorCI.php', N'lightBlue', 4, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (23, N'Monitor AMI', 2, N'icon control-panel', N'Monitor AMI', N'MonitorAMI.php', N'lightBlue', 4, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (24, N'Monitor Concentrador', 2, N'icon control-panel', N'text', N'4', N'lightBlue', 4, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (25, N'Gestión de la Distribución', 2, N'icon distribution-management', N'text', N'4', N'lightBlue', 4, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (26, N'Calidad de Servicio', 2, N'icon calidadservicio', N'text', N'4', N'lightBlue', 4, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (27, N'Balance de Energía', 2, N'icon balanceenergia', N'text', N'4', N'lightBlue', 4, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (28, N'VEE', 1, N'icon validation-edition-estimate', N'text', N'19', N'green', 5, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (29, N'Generación de Estimaciones', 2, N'icon estimation', N'text', N'estimacion.php', N'green', 19, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (30, N'Validacin de Lecturas', 2, N'icon validation', N'text', N'5', N'green', 19, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (31, N'Edición de Datos', 2, N'icon edition', N'text', N'edit_read_profile_form.php', N'green', 19, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (32, N'Recálculo KE', 2, N'icon recalculation-ke', N'Recálculo KE', N'recalculoKE.php', N'green', 19, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (33, N'Cálculo de Demanda ', 1, N'icon demand-calculation', N'text', N'5', N'green', 5, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (34, N'Tareas Programadas', 2, N'icon scheduled-tasks', N'text', N'tareas_grid.php', N'green', 5, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (35, N'Reportes Programados', 2, N'icon scheduled-reports', N'text', N'reportes_dinamicos_grid.php', N'green', 5, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (36, N'Import / Export de Datos', 1, N'icon import-export', N'text', N'21', N'green', 5, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (37, N'Interfaz con Sistemas de Gestión', 1, N'icon managment-interface', N'text', N'7', N'violet', 7, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (38, N'Anomalías', 1, N'icon anomalies', N'text', N'23', N'lightBlue', 4, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (39, N'Monitor MDC', 2, N'icon control-panel', N'text', N'5', N'green', 5, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (40, N'Monitoreo de Transformadores', 2, N'icon transformer-monitoring', N'text', N'5', N'green', 5, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (41, N'Log MDC', 2, N'icon log-muc', N'Log MDC', N'log_mdc.php', N'green', 5, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (42, N'Gestión de Alarmas', 2, N'icon alarm', N'text', N'5', N'green', 5, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (43, N'Tareas Activas', 2, N'icon active-tasks', N'Tareas Activas', N'tareas_activas_grid.php', N'green', 5, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (44, N'Mi Cuenta', 1, N'icon user', N'text', N'8', N'yellow', 8, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (45, N'Configuración Men', 2, N'icon configuracionmenu', N'Configuración Men', N'configuracion_menu.php', N'yellow', 8, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (46, N'Distribución Men', 2, N'icon distribucionmenu', N'Distribución Men', N'configurarMenu.php', N'yellow', 8, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (47, N'Carpeta Personal', 2, N'icon personal-folder', N'Carpeta Personal', N'userFolder.php', N'yellow', 8, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (48, N'Clientes', 2, N'icon clients', N'text', N'clientes_grid.php', N'orange', 6, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (49, N'Medidores', 2, N'icon meters', N'text', N'medidores_grid.php', N'orange', 6, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (50, N'Medidores Virtuales', 2, N'icon virtual-meters', N'text', N'medidores_virtuales_grid.php', N'orange', 6, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (51, N'Variables', 1, N'icon variables', N'Variables', N'12', N'orange', 6, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (52, N'Concentradores', 2, N'icon concentrators', N'Concentradores', N'concentradores_grid.php', N'orange', 6, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (53, N'Campos Adicionales', 2, N'icon additional-fields', N'Campos Adicionales', N'user_defined_grid.php', N'orange', 6, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (54, N'Grupos de Punto de Medida', 2, N'icon group-of-meters', N'text', N'grupos_medidores_grid.php', N'orange', 6, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (55, N'Puntos de Medida', 2, N'icon measured-points', N'text', N'puntos_medida_grid.php', N'orange', 6, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (56, N'Prosumidores', 2, N'icon prosumers', N'text', N'6', N'orange', 6, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (57, N'TOU', 1, N'icon tou', N'text', N'20', N'orange', 6, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (58, N'Agentes', 2, N'icon agents', N'text', N'agentes_grid.php', N'violet', 9, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (59, N'Puertos', 2, N'icon port', N'text', N'puertos_grid.php', N'violet', 9, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (60, N'Grupos', 2, N'icon port-groups', N'text', N'grupos_grid.php', N'violet', 9, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (61, N'Discadores', 2, N'icon dialers', N'text', N'discadores_grid.php', N'violet', 9, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (62, N'Hangers', 2, N'icon settings', N'Hangers', N'hangers_grid.php', N'violet', 9, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (63, N'Tipo de Autenticación', 1, N'icon settings', N'text', N'10', N'violet', 10, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (64, N'Protocolos', 1, N'icon settings', N'text', N'10', N'violet', 10, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (65, N'Marcas y Modelos', 2, N'icon marcamodelo', N'Marcas y Modelos', N'brandmodel_grid.php', N'violet', 10, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (66, N'Ciudades', 2, N'icon cities', N'Ciudades', N'ciudades_grid.php', N'violet', 10, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (67, N'Eventos / Alarmas', 2, N'icon alarm', N'Eventos / Alarmas', N'eventos_alarmas_grid.php', N'orange', 12, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (68, N'Registros / Canales de Perfil', 2, N'icon instant-records', N'Registros / Canales', N'canales_grid.php', N'orange', 12, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (69, N'Eventos de Concentrador', 2, N'icon concentrators', N'Eventos de concentrador', N'var_concentradores_grid.php', N'orange', 12, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (70, N'Parámetros de Reportes', 2, N'icon dynamic-reports', N'text', N'config_parametros_grid.php', N'violet', 13, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (71, N'Configuración de Reportes', 2, N'icon report-configuration', N'text', N'config_reportes_grid.php', N'violet', 13, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (72, N'Agentes y Puertos', 1, N'icon port-agents', N'text', N'9', N'violet', 14, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (73, N'Schedulers', 2, N'icon schedule', N'Schedulers', N'scheduler_grid.php', N'violet', 14, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (74, N'Desempaquetadores', 2, N'icon unpacker', N'Desempaquetadores', N'unpackers_grid.php', N'violet', 14, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (75, N'Shares', 2, N'icon shares', N'Shares', N'shares_grid.php', N'violet', 14, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (76, N'Empresas', 2, N'icon company', N'text', N'empresas_grid.php', N'violet', 15, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (77, N'Usuarios', 2, N'icon users', N'text', N'usuarios_grid.php', N'violet', 15, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (78, N'Roles', 2, N'icon roles', N'Roles', N'roles_grid.php', N'violet', 15, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (79, N'Servicio de Autenticación', 2, N'icon authentication-servers', N'Servidores de Aut.', N'servidores_autenticacion_grid.php', N'violet', 15, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (80, N'Resumen Eventos de Medidores', 2, N'icon events', N'Eventos por Medidores', N'eventosMedidores.php', N'red', 16, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (81, N'Resumen Eventos de CNC ', 2, N'icon events', N'Eventos Concentradores', N'eventosConcentradores.php', N'red', 16, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (82, N'Análisis de Eventos', 2, N'icon events', N'Eventos Analissi ', N'eventosAtencion.php', N'red', 16, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (83, N'Comunicación', 1, N'icon comunications', N'Comunicaciones', N'14', N'violet', 7, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (84, N'Autenticación', 1, N'icon autentification', N'Autenticación', N'15', N'violet', 7, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (85, N'Cubo Perfil', 2, N'icon cube', N'Cubo Perfil', N'perfil.php', N'yellow', 18, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (86, N'Consulta Perfil', 2, N'icon queries', N'Consulta Perfil', N'perfilGrafico.php?m=2', N'yellow', 18, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (87, N'Tablas varias', 1, N'icon settings', N'text', N'10', N'violet', 7, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (88, N'Licencias', 2, N'icon settings', N'text', N'licencias', N'violet', 7, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (89, N'Configuración de Reportes', 1, N'icon dynamic-reports', N'Reportes', N'13', N'violet', 7, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (90, N'Plantillas Medidores', 2, N'icon settings', N'Plantillas medidores', N'medidores_template_grid.php', N'violet', 7, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (91, N'Cubo Perfil', 2, N'icon cube', N'Cubo Perfil', N'perfil.php', N'red', 17, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (92, N'Consulta Perfil', 2, N'icon queries', N'Consulta Perfil', N'perfilGrafico.php?m=3', N'red', 17, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (95, N'Corte y Reconexión', 2, N'icon cut-conection', N'Acciones Control', N'accionesControl.php', N'green', 5, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (97, N'Composición TOU', 2, N'icon composiciontou', N'text', N'configTOU.php', N'orange', 20, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (98, N'Asignación de Tarifas', 2, N'icon asignaciontarifastou', N'text', N'configDay.php', N'orange', 20, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (99, N'Configuración TOU', 2, N'icon configuraciontou', N'text', N'tou.php', N'orange', 20, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (100, N'Importación Prn ', 2, N'icon importacionprn', N'text', N'transf_datos.php', N'green', 21, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (101, N'Importación Datos', 2, N'icon importaciondatos', N'text', N'importacionDatos.php', N'green', 21, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (102, N'Importación configuraciones', 1, N'icon importacionconfiguracion', N'text', N'21', N'green', 21, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (103, N'Origen de Datos', 2, N'icon settings', N'Origen de datos', N'origin_grid.php', N'violet', 10, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (104, N'Auditoría', 1, N'icon settings', N'text', N'22', N'green', 5, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (105, N'Auditoría Estimación', 2, N'icon settings', N'Auditoría Estimación', N'Auditoría_estimacion.php', N'green', 22, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (106, N'Auditoría Recálculo Ke', 2, N'icon settings', N'Auditoría Recálculo Ke', N'Auditoría_factor.php', N'green', 22, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (107, N'Auditoría Importación Datos', 2, N'icon settings', N'Aud. Importación Datos', N'Auditoría_importacion.php', N'green', 22, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (108, N'Configuración de Anomalías', 2, N'icon settings', N'text', N'anomalias', N'lightBlue', 23, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (109, N'Visualización de Información', 2, N'icon analytic', N'text', N'anomalias/visualizacion', N'lightBlue', 23, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (110, N'Recolección de Datos', 2, N'icon import-export', N'Recolección de Datos', N'anomalias/importar', N'lightBlue', 23, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (111, N'Análisis de Anomalías', 2, N'icon anomalies', N'Análisis de Anomalías', N'anomalias/analizar', N'lightBlue', 23, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (112, N'Descripciones de Usuario', 2, N'icon log-muc', N'Descripciones de Usuario', N'descripcion_evento_grid.php', N'orange', 12, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (113, N'Panel de Control', 1, N'icon analytic', N'text', N'24', N'violet', 14, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (114, N'Controladores', 2, N'icon settings', N'text', N'panel-de-control/controlador', N'violet', 24, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (115, N'Monitores', 2, N'icon control-panel', N'text', N'panel-de-control/monitores', N'violet', 24, N'fg-white', N'tile', NULL, NULL)

INSERT [dbo].[s_menu_items] ([menu_item_id], [menu_item_name], [menu_item_type], [menu_item_icono], [menu_item_text], [menu_item_hlink], [menu_item_bgcolor], [menu_id], [menu_item_fcolor], [menu_item_size], [menu_item_route], [menu_item_info]) VALUES (116, N'Loggers', 2, N'icon settings', N'text', N'panel-de-control/loggers', N'violet', 24, N'fg-white', N'tile', NULL, NULL)


--Taba s_menu_topology

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (1, 1, 1, NULL)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (1, 2, 1, NULL)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (1, 3, 1, NULL)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (1, 4, 1, NULL)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (1, 5, 1, NULL)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (1, 6, 1, NULL)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (2, 7, 2, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (2, 8, 2, 5)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (2, 9, 2, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (2, 10, 2, 4)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (2, 11, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (2, 12, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (2, 13, 2, 7)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (2, 14, 2, 6)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (3, 15, 2, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (3, 16, 2, 4)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (3, 17, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (3, 18, 2, 5)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (3, 19, 2, 6)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (3, 20, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (3, 21, 2, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (4, 22, 1, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (4, 23, 1, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (4, 24, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (4, 25, 2, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (4, 26, 2, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (4, 27, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (12, 112, 2, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (5, 28, 1, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (5, 33, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (5, 34, 1, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (5, 35, 1, 5)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (5, 36, 1, 6)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (24, 114, 1, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (5, 95, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (7, 37, 2, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (4, 38, 1, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (5, 39, 2, 4)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (5, 40, 2, 5)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (5, 41, 1, 7)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (5, 42, 2, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (5, 43, 1, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (5, 104, 1, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (6, 48, 1, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (6, 49, 1, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (6, 50, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (6, 51, 1, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (6, 52, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (6, 53, 2, 4)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (6, 54, 1, 4)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (6, 55, 1, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (6, 56, 2, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (6, 57, 2, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (7, 83, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (7, 84, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (7, 87, 2, 5)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (7, 88, 2, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (7, 89, 2, 4)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (7, 90, 2, 6)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (8, 44, 1, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (8, 45, 1, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (8, 46, 1, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (8, 47, 1, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (9, 58, 1, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (9, 59, 1, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (9, 60, 1, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (9, 61, 1, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (9, 62, 1, 4)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (10, 63, 1, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (10, 64, 1, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (10, 65, 1, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (10, 66, 1, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (10, 103, 1, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (12, 67, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (12, 68, 2, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (12, 69, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (13, 70, 1, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (13, 71, 1, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (14, 72, 1, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (14, 73, 1, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (14, 74, 1, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (14, 75, 1, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (15, 76, 1, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (15, 77, 1, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (15, 78, 1, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (15, 79, 1, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (16, 80, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (16, 81, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (16, 82, 2, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (17, 91, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (17, 92, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (18, 85, 1, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (18, 86, 1, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (19, 29, 2, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (19, 30, 2, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (19, 31, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (19, 32, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (20, 97, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (20, 98, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (20, 99, 2, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (21, 100, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (21, 101, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (21, 102, 2, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (22, 105, 2, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (22, 106, 2, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (22, 107, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (23, 108, 2, 3)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (23, 109, 2, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (23, 110, 2, 0)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (23, 111, 2, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (24, 115, 1, 1)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (24, 116, 1, 2)

INSERT [dbo].[s_menu_topology] ([menu_id], [menu_item_id], [menu_col], [menu_order]) VALUES (14, 113, 1, 0)

--Tabla s_rol_menu
INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (1, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (1, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (1, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (1, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (2, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (2, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (2, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (2, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (3, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (3, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (3, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (3, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (4, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (4, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (4, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (4, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (5, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (5, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (5, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (5, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (6, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (6, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (6, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (6, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (7, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (7, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (7, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (7, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (8, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (8, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (8, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (8, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (9, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (9, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (9, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (9, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (10, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (10, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (10, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (10, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (11, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (11, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (11, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (11, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (12, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (12, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (12, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (12, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (13, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (13, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (13, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (13, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (14, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (14, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (14, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (14, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (15, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (15, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (15, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (15, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (16, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (16, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (16, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (16, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (17, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (17, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (17, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (17, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (18, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (18, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (18, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (18, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (19, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (19, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (19, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (19, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (20, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (20, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (20, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (20, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (21, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (21, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (21, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (21, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (22, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (22, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (22, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (22, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (23, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (23, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (23, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (23, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (24, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (24, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (24, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (24, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (25, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (25, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (25, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (25, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (26, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (26, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (26, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (26, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (27, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (27, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (27, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (27, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (28, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (28, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (28, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (28, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (29, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (29, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (29, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (29, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (30, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (30, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (30, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (30, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (31, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (31, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (31, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (31, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (32, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (32, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (32, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (32, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (33, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (33, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (33, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (33, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (34, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (34, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (34, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (34, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (35, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (35, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (35, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (35, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (36, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (36, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (36, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (36, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (37, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (37, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (37, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (37, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (38, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (38, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (38, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (38, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (39, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (39, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (39, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (39, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (40, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (40, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (40, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (40, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (41, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (41, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (41, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (41, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (42, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (42, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (42, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (42, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (43, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (43, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (43, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (43, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (44, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (44, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (44, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (44, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (45, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (45, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (45, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (45, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (46, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (46, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (46, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (46, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (47, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (47, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (47, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (47, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (48, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (48, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (48, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (48, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (49, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (49, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (49, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (49, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (50, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (50, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (50, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (50, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (51, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (51, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (51, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (51, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (52, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (52, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (52, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (52, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (53, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (53, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (53, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (53, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (54, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (54, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (54, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (54, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (55, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (55, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (55, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (55, 1, 1, 3, 0)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (56, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (56, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (56, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (56, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (57, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (57, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (57, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (57, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (58, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (58, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (58, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (58, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (59, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (59, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (59, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (59, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (60, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (60, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (60, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (60, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (61, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (61, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (61, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (61, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (62, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (62, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (62, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (62, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (63, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (63, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (63, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (63, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (64, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (64, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (64, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (64, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (65, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (65, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (65, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (65, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (66, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (66, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (66, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (66, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (67, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (67, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (67, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (67, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (68, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (68, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (68, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (68, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (69, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (69, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (69, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (69, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (70, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (70, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (70, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (70, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (71, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (71, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (71, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (71, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (72, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (72, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (72, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (72, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (73, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (73, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (73, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (73, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (74, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (74, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (74, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (74, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (75, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (75, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (75, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (75, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (76, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (76, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (76, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (76, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (77, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (77, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (77, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (77, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (78, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (78, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (78, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (78, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (79, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (79, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (79, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (79, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (80, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (80, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (80, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (80, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (81, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (81, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (81, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (81, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (82, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (82, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (82, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (82, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (83, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (83, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (83, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (83, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (84, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (84, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (84, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (84, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (85, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (85, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (85, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (85, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (86, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (86, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (86, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (86, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (87, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (87, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (87, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (87, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (88, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (88, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (88, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (88, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (89, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (89, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (89, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (89, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (90, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (90, 2, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (90, 2, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (90, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (91, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (91, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (91, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (91, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (92, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (92, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (92, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (92, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (95, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (95, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (95, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (95, 2, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (97, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (97, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (97, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (97, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (98, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (98, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (98, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (98, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (99, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (99, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (99, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (99, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (100, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (100, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (100, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (100, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (101, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (101, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (101, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (101, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (102, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (102, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (102, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (102, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (103, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (103, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (103, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (103, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (104, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (105, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (106, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (107, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (104, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (105, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (106, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (107, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (104, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (105, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (106, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (107, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (108, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (108, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (108, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (108, 1, 1, 3, 1)


INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (109, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (109, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (109, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (109, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (110, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (110, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (110, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (110, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (111, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (111, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (111, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (111, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (112, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (112, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (112, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (112, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (113, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (113, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (113, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (113, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (114, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (114, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (114, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (114, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (115, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (115, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (115, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (115, 1, 1, 3, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (116, 1, 1, 0, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (116, 1, 1, 1, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (116, 1, 1, 2, 1)

INSERT [dbo].[s_rol_menu] ([menu_item_id], [item_visible], [item_permission], [rol_id], [permission]) VALUES (116, 1, 1, 3, 1)


INSERT INTO migrations(migration,batch)values(CONCAT('insersion_de_script_','Insert1-EjecutaLineaLinea.sql'),1);