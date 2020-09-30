-- ==================================================================================================================
--WARNING: Before executing this script, ensure to change [Client1] in the next lines, for the Client database name
-- ==================================================================================================================
USE Client1_Base;
GO

--cambiamos el nombre de la tabla m_schedulers_tasks_res, contenia un espacio en blanco al final
exec sp_rename 'm_schedulers_tasks_res ', 'm_schedulers_tasks_res';
GO
--cambiamos el nombre de la columna task de la tabla m_schedulers_tasks_res, contenia un espacio en blanco al final
EXECUTE sp_rename 'm_schedulers_tasks_res.task ', 'task', 'COLUMN';
GO
--cambiamos el nombre de la columna s_tz de la tabla m_aux_done_tasks, contenia un espacio en blanco al final
EXECUTE sp_rename 'm_aux_done_tasks.s_tz ', 's_tz', 'COLUMN';
GO


--cambiamos el tipo de dato de r_report de numeric a integer.

--borramos las foreaneas
alter table r_report_parameters drop CONSTRAINT [FK_report_parameters_2];
alter table r_report_parameters drop CONSTRAINT [FK_report_parameters_1];
alter table r_schedule_report drop CONSTRAINT [FK_report_schedule_1];

alter table r_parameters_schedule drop CONSTRAINT [FK_r_parameters_schedule_1];
alter table r_parameters_schedule drop CONSTRAINT [FK_r_parameters_schedule_2];
GO
--borramos la restriccion de clave primaria
DECLARE @sql NVARCHAR(MAX)
WHILE 1=1
BEGIN
    SELECT TOP 1 @sql = N'alter table r_report drop constraint '+kc.NAME+N''
    from sys.key_constraints kc
    JOIN sys.tables t
        ON t.object_id = kc.parent_object_id
    WHERE 
        t.name = 'r_report'
    AND kc.name like 'PK%%'
    IF @@ROWCOUNT = 0 BREAK
    EXEC (@sql)
END
GO

--borramos la restriccion tambien en r_report_parameters
DECLARE @sql NVARCHAR(MAX)
WHILE 1=1
BEGIN
    SELECT TOP 1 @sql = N'alter table r_report_parameters drop constraint '+kc.NAME+N''
    from sys.key_constraints kc
    JOIN sys.tables t
        ON t.object_id = kc.parent_object_id
    WHERE 
        t.name = 'r_report_parameters'
    AND kc.name like 'PK%%'
    IF @@ROWCOUNT = 0 BREAK
    EXEC (@sql)
END
GO

--borramos la restriccion tambien en r_report_parameters
DECLARE @sql NVARCHAR(MAX)
WHILE 1=1
BEGIN
    SELECT TOP 1 @sql = N'alter table r_parameters drop constraint '+kc.NAME+N''
    from sys.key_constraints kc
    JOIN sys.tables t
        ON t.object_id = kc.parent_object_id
    WHERE 
        t.name = 'r_parameters'
    AND kc.name like 'PK%%'
    IF @@ROWCOUNT = 0 BREAK
    EXEC (@sql)
END
GO

--borramos la restriccion tambien en r_report_parameters
DECLARE @sql NVARCHAR(MAX)
WHILE 1=1
BEGIN
    SELECT TOP 1 @sql = N'alter table r_parameters_schedule drop constraint '+kc.NAME+N''
    from sys.key_constraints kc
    JOIN sys.tables t
        ON t.object_id = kc.parent_object_id
    WHERE 
        t.name = 'r_parameters_schedule'
    AND kc.name like 'PK%%'
    IF @@ROWCOUNT = 0 BREAK
    EXEC (@sql)
END
GO
--borramos la restriccion tambien en r_report_parameters
DECLARE @sql NVARCHAR(MAX)
WHILE 1=1
BEGIN
    SELECT TOP 1 @sql = N'alter table r_schedule_report drop constraint '+kc.NAME+N''
    from sys.key_constraints kc
    JOIN sys.tables t
        ON t.object_id = kc.parent_object_id
    WHERE 
        t.name = 'r_schedule_report'
    AND kc.name like 'PK%%'
    IF @@ROWCOUNT = 0 BREAK
    EXEC (@sql)
END
GO

alter table r_report alter column reportid int not null
GO
alter table r_report_parameters alter column reportid int not null
GO
alter table r_report_parameters alter column id_param int not null
GO
alter table r_report_log alter column reportid int not null
GO
alter table r_schedule_report alter column reportid int not null
GO
alter table r_parameters alter column id_param int not null
GO
alter table r_parameters_schedule alter column sch_report_id int not null
GO
alter table r_schedule_report alter column sch_report_id int not null
GO
alter table r_parameters_schedule alter column id_param int not null
GO



SET ANSI_PADDING ON
GO


ALTER TABLE [dbo].[r_report] ADD  CONSTRAINT [PK_REPORT] PRIMARY KEY CLUSTERED 
(
	[reportid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


ALTER TABLE [dbo].[r_report_parameters] ADD PRIMARY KEY CLUSTERED 
(
	[id_param] ASC,
	[reportid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[r_parameters] ADD PRIMARY KEY CLUSTERED 
(
	[id_param] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[r_parameters_schedule] ADD PRIMARY KEY CLUSTERED 
(
	[id_param] ASC,
	[sch_report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[r_schedule_report] ADD PRIMARY KEY CLUSTERED 
(
	[sch_report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[r_report_parameters]  WITH CHECK ADD  CONSTRAINT [FK_report_parameters_2] FOREIGN KEY([REPORTID])
REFERENCES [dbo].[r_report] ([REPORTID])
GO
ALTER TABLE [dbo].[r_report_parameters] CHECK CONSTRAINT [FK_report_parameters_2]
GO
ALTER TABLE [dbo].[r_schedule_report]  WITH CHECK ADD  CONSTRAINT [FK_report_schedule_1] FOREIGN KEY([REPORTID])
REFERENCES [dbo].[r_report] ([REPORTID])
GO
ALTER TABLE [dbo].[r_schedule_report] CHECK CONSTRAINT [FK_report_schedule_1]
GO
ALTER TABLE [dbo].[r_parameters_schedule]  WITH CHECK ADD  CONSTRAINT [FK_r_parameters_schedule_1] FOREIGN KEY([ID_PARAM])
REFERENCES [dbo].[r_parameters] ([ID_PARAM])
GO
ALTER TABLE [dbo].[r_parameters_schedule] CHECK CONSTRAINT [FK_r_parameters_schedule_1]
GO
ALTER TABLE [dbo].[r_parameters_schedule]  WITH CHECK ADD  CONSTRAINT [FK_r_parameters_schedule_2] FOREIGN KEY([SCH_REPORT_ID])
REFERENCES [dbo].[r_schedule_report] ([SCH_REPORT_ID])
GO
ALTER TABLE [dbo].[r_parameters_schedule] CHECK CONSTRAINT [FK_r_parameters_schedule_2]
GO
ALTER TABLE [dbo].[r_report_parameters]  WITH CHECK ADD  CONSTRAINT [FK_report_parameters_1] FOREIGN KEY([ID_PARAM])
REFERENCES [dbo].[r_parameters] ([ID_PARAM])
GO
ALTER TABLE [dbo].[r_report_parameters] CHECK CONSTRAINT [FK_report_parameters_1]
GO


--eliminar indice con problema
drop index m_event.IX_m_event_datetime_pc;
CREATE NONCLUSTERED INDEX IX_m_event_datetime_pc
ON m_event (datetime_pc)
INCLUDE (meter_id,meter_t,local_t,ms,report,cnc_id)
GO



EXEC sp_rename 'm_profile.<UX_M_PROFILE>', 'UX_M_PROFILE', 'INDEX';   
GO  









/*
 
CREATE TABLE Client2.dbo.migrations (
	id int IDENTITY(1,1) NOT NULL,
	migration varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
	batch int NOT NULL,
	CONSTRAINT PK__migratio__3213E83F3EFED35A PRIMARY KEY (id)
) GO;


INSERT INTO migrations VALUES('2020_09_02_164512_create_a_anomalies_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_a_licenses_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_a_magnitudes_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_a_meters_magnitudes_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_a_meters_variables_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_a_ocurrences_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_a_readings_ocurrences_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_a_readings_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_a_variables_magnitudes_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_c_city_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_c_customers_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_c_customers_ud_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_c_tz_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_d_cube_config_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_d_cube_saved_designs_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_d_cube_saved_filters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_d_cube_status_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_h_pasaje_programado_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_h_pasaje_status_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_h_server_historical_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_last_rep_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_active_tasks_res_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_active_tasks_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_agents_dc_adv_parameters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_agents_dc_parameters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_agents_parameters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_agents_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_agent_dc_clou_params_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_agent_dc_cosem_params_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_agent_dc_dlmsip_params_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_agent_dc_ip_params_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_agent_dc_protocol_stack_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_app_abb_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_app_ansi_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_app_dlms_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_app_iec62056_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_app_iec_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_app_pa_data_old_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_app_pa_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_app_pml_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_app_protos_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_app_schl_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_app_vm_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_audit_estimation_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_audit_factor_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_audit_import_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_aux_done_tasks_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_brands_commands_res_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_brands_commands_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_calendar_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_call_history_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_call_stages_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_cnc_brands_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_cnc_clou_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_cnc_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_commands_res_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_commands_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_config_tasks_res_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_config_tasks_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_converters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_day_type_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_dialers_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_dialers_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_done_tasks_res_p_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_done_tasks_res_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_done_tasks_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_event_cnc_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_event_group_cnc_c_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_event_group_cnc_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_event_group_c_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_event_group_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_event_list_cnc_c_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_event_list_cnc_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_event_list_c_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_event_list_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_event_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_ev_desc_map_cnc_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_ev_desc_map_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_ev_map_cnc_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_ev_map_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_groups_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_hangers_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_hangers_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_link_abb_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_link_ansi_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_link_dlmsip_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_link_dlms_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_link_iec62056_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_link_iec_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_link_pml_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_link_schl_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_link_vm_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_location_meters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_location_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_location_ud_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_managed_cnc_list_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_meters_brands_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_meters_lastread_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_meters_plc_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_meters_reg_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_meters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_meters_templates_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_meters_ud_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_origin_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_phy_ip_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_phy_protos_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_phy_serial_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_ports_groups_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_ports_groups_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_ports_ip_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_ports_serial_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_ports_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_profile_date_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_profile_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_prof_map_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_rate_day_type_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_rate_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_raw_units_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_register_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_reg_desc_map_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_rele_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_schedulers_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_schedulers_tasks_res_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_seasons_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_shares_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_task_err_codes_res_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_task_err_codes_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_task_groups_config_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_task_groups_locations_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_task_groups_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_task_groups_tasks_map_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_task_groups_user_groups_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_task_parerr_codes_res_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_TOU_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_unesa_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_units_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_m_user_task_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_p_etl_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_r_dynamic_date_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_r_parameters_schedule_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_r_parameters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_r_report_log_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_r_report_parameters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_r_report_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_r_schedule_report_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_version_bd_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_vm_channels_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_vm_channel_assign_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_vm_meters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_vm_meter_assign_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_vm_profile_table',1);
INSERT INTO migrations VALUES('2020_09_02_164512_create_x_user_defined_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_a_magnitudes_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_a_meters_magnitudes_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_a_meters_variables_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_a_ocurrences_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_a_readings_ocurrences_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_a_readings_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_a_variables_magnitudes_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_c_customers_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_agents_dc_adv_parameters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_agents_dc_parameters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_agents_parameters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_app_ansi_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_app_dlms_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_app_iec62056_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_app_iec_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_app_pml_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_app_schl_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_app_vm_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_brands_commands_res_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_brands_commands_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_call_history_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_cnc_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_config_tasks_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_converters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_dialers_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_event_cnc_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_event_list_cnc_c_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_event_list_cnc_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_event_list_c_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_event_list_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_event_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_ev_desc_map_cnc_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_ev_desc_map_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_hangers_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_link_ansi_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_link_dlmsip_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_link_dlms_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_link_iec62056_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_link_iec_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_link_pml_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_link_schl_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_link_vm_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_location_meters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_location_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_meters_lastread_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_meters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_meters_templates_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_phy_ip_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_phy_serial_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_ports_groups_data_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_ports_groups_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_ports_ip_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_ports_serial_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_ports_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_profile_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_rate_day_type_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_register_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_reg_desc_map_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_shares_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_task_groups_config_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_task_groups_locations_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_task_groups_tasks_map_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_task_groups_user_groups_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_m_TOU_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_r_parameters_schedule_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_r_report_parameters_table',1);
INSERT INTO migrations VALUES('2020_09_02_164533_add_foreign_keys_to_r_schedule_report_table',1);
INSERT INTO migrations VALUES('2020_09_02_170000_create_triggerEjemplo',1);
*/