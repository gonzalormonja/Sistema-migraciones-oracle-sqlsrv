<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProcedureSpGetCubeProfile extends Migration
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
            $sql="CREATE PROCEDURE [dbo].[sp_GenCubeProfile]
                        @Desde varchar(8), 
                        @Hasta varchar(8),
                        @Top int,
                        @Rebuild int
                    AS
                    BEGIN
                        --DECLARO ESTAS VARIABLES PARA ARMAR LAS SENTENCIAS SQL QUE SERÁN EJECUTADASS
                        DECLARE @SQL nvarchar(max), @SQLADDF nvarchar(max), @SQLADDI nvarchar(max), @SQLSELF nvarchar(max), @SQLSELN nvarchar(max), @Params nvarchar(max)
                        SET @Params = N''
                        SET @SQL = N''
                        SET @SQLADDF = N''
                        SET @SQLADDI = N''
                        SET @SQLSELF = N''
                        SET @SQLSELN = N''
                        
                        --VERIFICO LA ESTRUCTURA DE LA TABLA CONSIDERANDO LOS CAMPOS DE USUARIO
                        DECLARE @ud_name varchar(50), @ud_type varchar(50),  @ud_long varchar(50), @ud_description varchar(500)
                    
                        --RECUPERO LOS CAMPOS DE USUARIO DEFINIDOS PARA LA TABLA MEDIDORES
                        DECLARE @fexist INT = 1
                        DECLARE field_cursor CURSOR FOR 
                        SELECT 
                            ud_name, 
                            ud_type, 
                            ud_long,
                            CASE WHEN ud_description = '' or ud_description is null THEN ud_name ELSE replace(ud_description, ' ', '_') END as 'ud_description'
                        FROM x_user_defined WHERE ud_table = 'm_meters'
                        OPEN field_cursor  
                        FETCH NEXT FROM field_cursor INTO @ud_name, @ud_type, @ud_long, @ud_description 
                    
                        --RECORRO LA LISTA DE CAMPOS DE USUARIO Y VERIFICO SI EXISTEN EN LA TABLA DEL CUBO
                        WHILE @@FETCH_STATUS = 0  
                        BEGIN
                            --SETEO QUE HAY QUE TRABAJAR CON CAMPOS DE USUARIO
                            --print 'Name: ' + @ud_name
                            --print 'Type: ' + @ud_type
                            --print 'Long: ' + @ud_long
                            --print 'Description: ' + @ud_description
                    
                            IF (@ud_type = 'varchar') BEGIN 
                                SET @ud_type += '(' + @ud_long + ')' 
                            END
                    
                            --SI EL CAMPO EXISTE, LA BANDERA ES IGUAL A 1
                            SET @fexist = (select COUNT(object_id) from sys.columns where object_id = object_id('d_profile') and name = @ud_name)
                            --print 'fexist: ' + cast(@fexist as varchar)
                            IF (@fexist = 0) BEGIN
                                --SI ENCUENTRO AL MENOS UN CAMPO QUE NO ESTA EN LA TABLA, EL CUBO DEBE SER REGENERADO
                                SET @Rebuild = 1
                            END
                    
                            --GRABO LAS SENTENCIAS QUE VOY A NECESITAR EN EL CREATE (SI ES QUE SE HACE)
                            SET @SQLADDF += @ud_name + ' ' + @ud_type + ' NOT NULL , '
                            SET @SQLADDI += ', ' + @ud_name + ' ASC '
                    
                            --GRABO LAS SENTENCIAS QUE UTILIZARÉ COMO CAMPOS DE USUARIO DENTRO DEL SELECT QUE HACE EL INSERT
                            SET @SQLSELN += ', ' + @ud_name
                            IF (LEFT(@ud_type, 7) = 'varchar') BEGIN
                                SET @SQLSELF += ', isnull(ud.' + @ud_name + ', ''Indefinido'') AS ''' + @ud_description + ''' '
                            END ELSE 
                            IF (@ud_type = 'int' OR @ud_type = 'float' ) BEGIN
                                SET @SQLSELF += ', isnull(ud.' + @ud_name + ', 0)  AS ''' + @ud_description + ''' '
                            END ELSE 
                            IF (@ud_type = 'datetime') BEGIN
                                SET @SQLSELF += ', isnull(ud.' + @ud_name + ', ''19000101'')  AS ''' + @ud_description + ''' '
                            END
                    
                            FETCH NEXT FROM field_cursor INTO @ud_name, @ud_type, @ud_long, @ud_description
                        END 
                    
                        CLOSE field_cursor  
                        DEALLOCATE field_cursor 
                    
                        --print 'SQLADDF: ' + @SQLADDF
                        --print 'SQLADDI: ' + @SQLADDI
                        --print 'SQLSELF: ' + @SQLSELF
                        --print 'SQLSELN: ' + @SQLSELN
                    
                        --REGENERO LA TABLA SI ES NECESARIO
                        IF (@Rebuild = 1) BEGIN
                            DROP TABLE IF EXISTS d_profile
                            
                            SET @SQL = 'CREATE TABLE d_profile ( '
                            SET @SQL += '	Id bigint IDENTITY(1,1) NOT NULL, '
                            SET @SQL += '	m_profile_id bigint NOT NULL, '
                            SET @SQL += '	Fecha_Hora datetime NOT NULL, '
                            SET @SQL += '	Año int NOT NULL, '
                            SET @SQL += '	Mes int NOT NULL, '
                            SET @SQL += '	Dia int NOT NULL, '
                            SET @SQL += '	Hora int NOT NULL, '
                            SET @SQL += '	Intervalo int NOT NULL, '
                            SET @SQL += '	Cliente varchar(100) NOT NULL, '
                            SET @SQL += '	Ciudad varchar(100) NOT NULL, '
                            SET @SQL += '	Punto_de_Medida varchar(50) NOT NULL, '
                            SET @SQL += '	Medidor varchar(50) NOT NULL, '
                            SET @SQL += '	log int NOT NULL, '
                            SET @SQL += '	Canal_Protocolo varchar(100) NOT NULL, '
                            SET @SQL += '	Canal_Usuario varchar(100) NOT NULL, '
                            SET @SQL += '	Unidad_Protocolo varchar(100) NOT NULL, '
                            SET @SQL += '	Unidad_Usuario varchar(10) NOT NULL, '
                            SET @SQL += '	Valor float NOT NULL, '
                            SET @SQL += '	Valor_Demanda float NOT NULL, '
                            SET @SQL += '	Valor_Editado float NOT NULL, '
                            SET @SQL += '	Valor_Factor float NOT NULL, '
                            SET @SQL += @SQLADDF
                            SET @SQL += 'CONSTRAINT PK_d_profile PRIMARY KEY NONCLUSTERED (Id ASC), '
                            SET @SQL += 'CONSTRAINT UK_m_profile_id UNIQUE NONCLUSTERED (m_profile_id ASC), '
                            SET @SQL += 'CONSTRAINT UK_d_profile UNIQUE NONCLUSTERED ( '
                            SET @SQL += '	Id ASC, '
                            SET @SQL += '	m_profile_id ASC, '
                            SET @SQL += '	Fecha_Hora ASC, '
                            SET @SQL += '	Año ASC, '
                            SET @SQL += '	Mes ASC, '
                            SET @SQL += '	Dia ASC, '
                            SET @SQL += '	Hora ASC, '
                            SET @SQL += '	Intervalo ASC, '
                            SET @SQL += '	Cliente ASC, '
                            SET @SQL += '	Ciudad ASC, '
                            SET @SQL += '	Punto_de_Medida ASC, '
                            SET @SQL += '	Medidor ASC, '
                            SET @SQL += '	log ASC, '
                            SET @SQL += '	Canal_Protocolo ASC, '
                            SET @SQL += '	Canal_Usuario ASC, '
                            SET @SQL += '	Unidad_Protocolo ASC, '
                            SET @SQL += '	Unidad_Usuario ASC, '
                            SET @SQL += '	Valor ASC, '
                            SET @SQL += '	Valor_Demanda ASC, '
                            SET @SQL += '	Valor_Editado ASC, '
                            SET @SQL += '	Valor_Factor ASC '
                            SET @SQL += @SQLADDI
                            SET @SQL += '))'
                    
                            --print 'SQL 1: ' + @SQL
                            exec sp_executesql @SQL, @Params
                            CREATE CLUSTERED INDEX IX_dp_Fecha_Hora ON d_profile (Fecha_Hora);
                            CREATE NONCLUSTERED INDEX IX_dp_Año ON d_profile (Año);
                            CREATE NONCLUSTERED INDEX IX_dp_Mes ON d_profile (Mes);
                            CREATE NONCLUSTERED INDEX IX_dp_Dia ON d_profile (Dia);
                            CREATE NONCLUSTERED INDEX IX_dp_Cliente ON d_profile (Cliente);
                            CREATE NONCLUSTERED INDEX IX_dp_Punto_de_Medida ON d_profile (Punto_de_Medida);
                            CREATE NONCLUSTERED INDEX IX_dp_Medidor ON d_profile (Medidor);
                    
                            ALTER TABLE d_profile  WITH CHECK ADD CONSTRAINT [FK_d_profile_m_profile] FOREIGN KEY(m_profile_id)
                            REFERENCES m_profile (m_profile_id)
                    
                        END
                    
                        --GESTION DE FECHAS PARA REGISTROS A CONSOLIDAR
                        DECLARE @NDesdePC datetime
                        DECLARE @NDesde varchar(8)
                        SET @NDesde = @Desde
                        --SI NO SE INGRESA FECHA DESDE Y SE INDICA REBUILD, BUSCO EL 'DESDE' SETEADO POR PARAMETRO 
                        IF (@Desde = '' AND @Rebuild = '1') BEGIN
                            DECLARE @from datetime
                            SET @NDesde = dbo.fn_CubeGetFromGen ('profile')
                        END
                    
                        --SI SE CONSIDERA EL INGRESO DE UN RANGO DE FECHAS ELIMINO LO QUE ESTA CARGADO EN LA TABLA PARA CUBO EN EL RANGO DE FECHAS A GENERAR
                        IF (@NDesde <> '' OR @Hasta <> '') BEGIN
                            SET @SQL = 'DELETE d_profile where 1 = 1 '
                            IF (@NDesde <> '') BEGIN
                                SET @SQL += 'AND Fecha_Hora >= ''' + @NDesde + ''' '
                            END
                            IF (@Hasta <> '') BEGIN
                                SET @SQL += 'AND Fecha_Hora <= ''' + @Hasta + ''' '
                            END	
                            exec sp_executesql @SQL, @Params
                            --print 'SQL 2: ' + @SQL
                        END ELSE BEGIN
                            --VERIFICO LA ULTIMA FECHA DE EJECUCIÓN DEL CUBO PARA SABER QUÉ REGISTROS DE LA TABLA OPERATIVA DEBO INCREMENTAR EN LA CONSULTA
                            SET @NDesdePC = dbo.fn_CubeGetPreLastExecute ('profile')
                            --ELIMINO POSIBLES REGISTROS DENTRO DEL CUBO QUE DEBAN SER ELIMINADOS (FUERON MODIFICADOS EN M_PROFILE)
                            DELETE d_profile FROM m_profile WHERE d_profile.m_profile_id = m_profile.m_profile_id and m_profile.datetime_pc >= @NDesdePC
                        END
                    
                        --INSERTO LOS NUEVOS VALORES
                        SET @SQL = 'INSERT INTO d_profile ('
                        SET @SQL += 'm_profile_id, '
                        SET @SQL += 'Fecha_Hora, '
                        SET @SQL += 'Año, '
                        SET @SQL += 'Mes, '
                        SET @SQL += 'Dia, '
                        SET @SQL += 'Hora, '
                        SET @SQL += 'Intervalo, '
                        SET @SQL += 'Cliente, '
                        SET @SQL += 'Ciudad, '
                        SET @SQL += 'Punto_de_Medida, '
                        SET @SQL += 'Medidor, '
                        SET @SQL += 'log, '
                        SET @SQL += 'Canal_Protocolo, '
                        SET @SQL += 'Canal_Usuario, '
                        SET @SQL += 'Unidad_Protocolo, '
                        SET @SQL += 'Unidad_Usuario, '
                        SET @SQL += 'Valor, '
                        SET @SQL += 'Valor_Demanda, '
                        SET @SQL += 'Valor_Editado, '
                        SET @SQL += 'Valor_Factor '
                        SET @SQL += @SQLSELN
                        SET @SQL += ') '
                    
                        IF (@Top = '' AND @Rebuild = 1) BEGIN
                            SELECT @Top = max_reg_gen FROM d_cube_config WHERE main_filter = 'profile'
                        END ELSE
                        IF (@Top > 0) BEGIN 
                            SET @Top = @Top
                        END ELSE BEGIN
                            SELECT @Top = max_reg_day_exec FROM d_cube_config WHERE main_filter = 'profile'
                        END
                    
                        SET @SQL += 'SELECT TOP ' + CAST(@Top as varchar) + ' '
                        SET @SQL += 'p.m_profile_id AS ''m_profile_id'', '
                        SET @SQL += 'p.meter_t0 AS ''Fecha_Hora'', '
                        SET @SQL += 'year(p.meter_t0) AS ''Año'', '
                        SET @SQL += 'month(p.meter_t0) AS ''Mes'', '
                        SET @SQL += 'day(p.meter_t0) AS ''Dia'', '
                        SET @SQL += 'datepart(hour, p.meter_t0) AS ''Hora'', '
                        SET @SQL += 'datepart(minute, p.meter_t0) AS ''Intervalo'', '
                        SET @SQL += 'isnull(c.nombre, ''Indefinido'') AS ''Cliente'', '
                        SET @SQL += 'isnull(t.city, ''Indefinido'') AS ''Ciudad'', '
                        SET @SQL += 'isnull(l.name_meter_point, ''Indefinido'') AS ''Punto_de_Medida'', '
                        SET @SQL += 'm.meter_id AS ''Medidor'', '
                        SET @SQL += 'r.log AS ''Log'', '
                        SET @SQL += 'r.proto_descr AS ''Canal_Protocolo'', '
                        SET @SQL += 'CASE WHEN f.prof_std_desc = '''' OR f.prof_std_desc IS NULL THEN ''Indefinido'' ELSE f.prof_std_desc END AS ''Canal_Usuario'', '
                        SET @SQL += 'ISNULL(p.raw_unit, ''Indefinido'') as ''Unidad Protocolo'', '
                        SET @SQL += 'CASE WHEN u.descr = '''' OR u.descr IS NULL THEN ''Indefinido'' ELSE u.descr END AS ''Unidad_Usuario'', '
                        SET @SQL += 'p.val AS ''Valor'', '
                        SET @SQL += 'p.val_demand as ''Valor_Demanda'', '
                        SET @SQL += 'p.val_edit as ''Valor_Editado'', '
                        SET @SQL += 'p.val_factor as ''Valor_Factor'' '
                        
                        --AGREGO EN EL SELECT LOS CAMPOS DE USUARIO
                        SET @SQL += @SQLSELF
                        SET @SQL += 'FROM m_profile p '
                        SET @SQL += 'INNER JOIN m_meters m ON p.meter_id = m.meter_id '
                        SET @SQL += 'LEFT JOIN m_location_meters lm ON lm.meter_id = m.meter_id AND lm.active_date < p.meter_t0 AND (lm.deactiv_date IS NULL OR lm.deactiv_date = '''' OR lm.deactiv_date > p.meter_t0) '
                        SET @SQL += 'LEFT JOIN m_location l ON l.id_meter_point = lm.id_meter_point '
                        SET @SQL += 'LEFT JOIN c_customers c ON l.customer_id =  c.customer_id '
                        SET @SQL += 'LEFT JOIN c_city t ON c.id_city = t.id '
                        SET @SQL += 'INNER JOIN m_reg_desc_map r ON p.reg_descr_id = r.id '
                        SET @SQL += 'LEFT JOIN m_prof_map f ON f.prof_app_id = r.app_id '
                        SET @SQL += 'LEFT JOIN m_units u ON p.unit = u.descr '
                        SET @SQL += 'LEFT JOIN m_meters_ud ud ON m.meter_id = ud.meter_id '
                        
                        SET @SQL += ' WHERE 1=1 '
                        IF (@NDesdePC IS NOT NULL) BEGIN
                            SET @SQL += 'AND p.datetime_pc > @PC '
                        END
                        IF (@NDesde <> '') BEGIN
                            SET @SQL += 'AND p.meter_t0 >= ''' + @NDesde + ''' '
                        END
                        IF (@Hasta <> '') BEGIN
                            SET @SQL += 'AND p.meter_t0 <= ''' + @Hasta + ''' '
                        END
                    
                        --print 'SQL 3: ' + @SQL
                        exec sp_executesql @SQL, N'@PC datetime', @PC = @NDesdePC
                        
                        --VERIFICO SI SE SOBREPASO EL LIMITE ESPECIFICADO DE TAMAÑO MAXIMO PARA TABLA CONSOLIDADA
                        DECLARE @maxreg INT
                        DECLARE @curreg INT
                        SET @maxreg = (SELECT max_saving_reg FROM d_cube_config WHERE main_filter = 'profile')
                        SET @curreg = (SELECT COUNT(Id) FROM d_profile)
                        IF @maxreg < @curreg BEGIN
                            DECLARE @topreg INT
                            SET @topreg = @curreg - @maxreg
                            SET @SQL = 'DELETE FROM d_profile WHERE Id IN (SELECT TOP ' + CAST(@topreg as varchar) + ' Id FROM d_profile ORDER BY Id asc)'
                            --print 'SQL 4: ' + @SQL
                            exec sp_executesql @SQL
                        END
                    
                    END";
            DB::unprepared($sql);
        }else{
            $sql=
            "
            CREATE OR REPLACE PROCEDURE sp_GenCubeProfile
            (
                ArgDesde VARCHAR2 := '',
                ArgHasta VARCHAR2 := '',
                ArgTop   NUMBER := 0,
                ArgRebuild NUMBER := 0
            ) AS
            vFlagTableExists NUMBER(4);
            vFlagDoDeletePorEjecucionManual NUMBER(1);
            vTop NUMBER(19, 0);             -- Top
            vSQL CLOB;                      -- Contains the full SQL statement to be executed
            vSQLADDF CLOB;                  -- Contains the SQL for user defined fields
            vTmpType VARCHAR2(100 CHAR);    -- Temporal variable to hold the Oracle type equivalent of UD_TYPE
            vTmpTypeLength VARCHAR2(5 CHAR);    -- When custom field type is VARCHAR2, this variable will hold 'CHAR' in the length declaration
            vTmpFieldTypeLengthDetails VARCHAR2(100 CHAR);
            vTmpDefaultValue VARCHAR2(100 CHAR);
            vSQLADDI CLOB;
            vSQLSELF CLOB;
            vSQLSELFASDESCRIPTION VARCHAR2(100 CHAR);
            vParams CLOB;
            vDoRebuild NUMBER := 0;         -- Flag, if 1, will drop and create table
            vDesde VARCHAR2(20 CHAR);
            vHasta VARCHAR2(20 CHAR);
            NDesdePC DATE;

            vROWCOUNT NUMBER(10);

            vUD_NAME VARCHAR2(50 CHAR);
            vUD_TYPE VARCHAR2(50 CHAR);
            vUD_LONG VARCHAR2(50 CHAR);
            vUD_DESCRIPTION VARCHAR2(500 CHAR);

            vMaxReg NUMBER(19, 0);
            vCurReg NUMBER(19, 0);
            vDiffRegQ NUMBER(19, 0);



            fEXISTS NUMBER(1) := 0;

                CURSOR c1
                    IS
                    SELECT *
                    FROM X_USER_DEFINED
                    WHERE UD_TABLE = 'm_meters';     
            BEGIN
                vSQL := '';
                
                SELECT COUNT(*) INTO vFlagTableExists FROM USER_TABLES WHERE TABLE_NAME = 'D_PROFILE';

                -- Desde
                IF (ArgDesde IS NULL) THEN
                    SELECT fn_CubeGetFromGen('profile') INTO vDesde FROM dual;
                ELSE
                    vDesde := ArgDesde;
                END IF;

                IF (LENGTH(vDesde) = 8) THEN
                        vDesde := SUBSTR(vDesde, 1, 4) || '-' || SUBSTR(vDesde, 5, 2) || '-' || SUBSTR(vDesde, 7, 2);
                END IF;

                IF LENGTH(vDesde) <= 10 THEN
                    vDesde := SUBSTR(vDesde, 1, 10) || ' 00:00:00';
                END IF;

                -- Hasta
                IF (ArgHasta IS NOT NULL) THEN
                    IF (LENGTH(ArgHasta) = 8) THEN
                        vHasta := SUBSTR(ArgHasta, 1, 4) || '-' || SUBSTR(ArgHasta, 5, 2) || '-' || SUBSTR(ArgHasta, 7, 2);
                    ELSE
                        vHasta := ArgHasta;
                    END IF;
                    IF LENGTH(vHasta) <= 10 THEN
                        vHasta := SUBSTR(vHasta, 1, 10) || ' 23:59:59';
                    END IF;
                END IF;

                IF ArgRebuild = 1 THEN
                    vDoRebuild := 1;
                END IF;

                -- (2) Ver que todos los campos de usuario existan en la tabla consolidada, de lo contrario, se debe rebuildear
                --     sin importar el parametro ArgRebuild
                
                vSQLADDF := '';
                vSQLADDI := '';
                vSQLSELF := '';

                FOR record IN c1 LOOP
                    -- Si tiene descripcion, me interesa usarla como nombre de campo. De lo contrario, uso el nombre del campo en BD
                    vSQLSELFASDESCRIPTION := UPPER(record.ud_name);
                    IF record.ud_description IS NOT NULL THEN
                        vSQLSELFASDESCRIPTION := UPPER(record.ud_description);
                    END IF;
                    
                    vTmpType := '';
                    vTmpTypeLength := '';
                    vTmpDefaultValue := '';
                    CASE
                        WHEN record.ud_type = 'varchar' THEN
                            vTmpType := 'VARCHAR2';
                            vTmpTypeLength := ' CHAR';
                            vTmpDefaultValue := '''Indefinido''';
                        WHEN record.ud_type = 'int' THEN
                            vTmpType := 'NUMBER';
                            vTmpTypeLength := ',0';
                            vTmpDefaultValue := '0';
                        WHEN record.ud_type = 'float' THEN
                            vTmpType := 'NUMBER';
                            vTmpTypeLength := ',2';
                            vTmpDefaultValue := '0';
                        WHEN record.ud_type = 'datetime' THEN
                            vTmpType := 'DATE';
                            vTmpTypeLength := '';
                            vTmpDefaultValue := 'TIMESTAMP ''1900-01-01 00:00:00''';
                        ELSE
                            vTmpType := 'VARCHAR2';
                            vTmpTypeLength := ' CHAR';
                            vTmpDefaultValue := '''Indefinido''';
                    END CASE;
                
                    vTmpFieldTypeLengthDetails := ' (' || record.ud_long || vTmpTypeLength || ')';
                    IF vTmpType = 'DATE' THEN
                        vTmpFieldTypeLengthDetails := ' ';
                    END IF;
                
                    vSQLADDF := vSQLADDF || '\"' || vSQLSELFASDESCRIPTION || '\"  ' || vTmpType || vTmpFieldTypeLengthDetails || ' NULL,' || chr(10);
                    vSQLADDI := vSQLADDI || ', \"' || vSQLSELFASDESCRIPTION || '\" ';
                    vSQLSELF := vSQLSELF || ', NVL(\"' || record.ud_name || '\", ' || vTmpDefaultValue || ') AS \"' ||  vSQLSELFASDESCRIPTION ||  '\" ';
                    
                    vROWCOUNT := 0;
                    SELECT COUNT(*) INTO vROWCOUNT FROM USER_TAB_COLS WHERE TABLE_NAME = 'D_PROFILE' AND COLUMN_NAME = vSQLSELFASDESCRIPTION;
                    IF vROWCOUNT = 0 THEN
                        vDoRebuild := 1;
                    END IF;
                END LOOP;


                -- (3) Ahora: si la tabla ya existe y la bandera es que hay que rebuildear, se droppea la tabla
                --     Si la condicion anterior no es verdadera, pero la tabla no existe, pongo la flag en 1 para que se cree

                DECLARE
                    q int;
                BEGIN
                    SELECT count (*) INTO q FROM user_tables WHERE table_name = upper('D_PROFILE');
                    CASE WHEN (vDoRebuild = 1 AND q > 0) THEN
                            EXECUTE IMMEDIATE 'DROP TABLE D_PROFILE';   
                        WHEN q = 0 THEN
                            vDoRebuild := 1;    -- No existe la tabla, por lo tanto tengo que forzar que se cree
                        ELSE
                            vDoRebuild := vDoRebuild;
                    END CASE;
                END;

                vSQL := '';
                IF vDoRebuild = 1 THEN
                    vSQL := 'CREATE TABLE d_profile ( ' || chr(10);
                    vSQL := vSQL || 'Id NUMBER(19, 0) GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE, ' || chr(10);
                    vSQL := vSQL || 'm_profile_id NUMBER(19, 0) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Fecha_Hora DATE NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Año NUMBER(10,0) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Mes NUMBER(10,0) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Dia NUMBER(10,0) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Hora NUMBER(10,0) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Intervalo NUMBER(10,0) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Cliente varchar2(100 CHAR) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Ciudad varchar2(100 CHAR) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Punto_de_Medida varchar2(50 CHAR) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Medidor varchar2(50 CHAR) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'log NUMBER(10,0) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Canal_Protocolo varchar2(100 CHAR) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Canal_Usuario varchar2(100 CHAR) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Unidad_Protocolo varchar2(100 CHAR) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Unidad_Usuario varchar2(10 CHAR) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Valor NUMBER(10, 2) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Valor_Demanda NUMBER(10, 2) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Valor_Editado NUMBER(10, 2) NOT NULL, ' || chr(10);
                    vSQL := vSQL || 'Valor_Factor NUMBER(10, 2) NOT NULL, ' || chr(10);
                    vSQL := vSQL ||  vSQLADDF || chr(10);
                    vSQL := vSQL || 'CONSTRAINT PK_d_profile PRIMARY KEY (Id), ' || chr(10);
                    vSQL := vSQL || 'CONSTRAINT UK_m_profile_id UNIQUE (m_profile_id) ' || chr(10);
                    vSQL := vSQL || ')';
                    EXECUTE IMMEDIATE vSQL;
                    EXECUTE IMMEDIATE 'CREATE INDEX IX_dp_Fecha_Hora ON d_profile (Fecha_Hora)';
                    EXECUTE IMMEDIATE 'CREATE INDEX IX_dp_Año ON d_profile (Año)';
                    EXECUTE IMMEDIATE 'CREATE INDEX IX_dp_Mes ON d_profile (Mes)';
                    EXECUTE IMMEDIATE 'CREATE INDEX IX_dp_Dia ON d_profile (Dia)';
                    EXECUTE IMMEDIATE 'CREATE INDEX IX_dp_Cliente ON d_profile (Cliente)';
                    EXECUTE IMMEDIATE 'CREATE INDEX IX_dp_Punto_de_Medida ON d_profile (Punto_de_Medida)';
                    EXECUTE IMMEDIATE 'CREATE INDEX IX_dp_Medidor ON d_profile (Medidor)';
                    EXECUTE IMMEDIATE 'ALTER TABLE d_profile  ADD CONSTRAINT FK_d_profile_m_profile FOREIGN KEY(m_profile_id) REFERENCES m_profile (m_profile_id)';
                ELSE
                    -- (4B) Si no se creó la tabla, borro los valores que serán reemplazados, si los hubiera
                    vSQL := 'DELETE d_profile where 1 = 1 ';
                    IF ArgDesde IS NOT NULL THEN
                        vFlagDoDeletePorEjecucionManual := 1;
                        vSQL := vSQL || ' AND Fecha_Hora >= TIMESTAMP ''' || vDesde || ''' ';
                    END IF;
                    IF ArgHasta IS NOT NULL THEN
                        vFlagDoDeletePorEjecucionManual := 1;
                        vSQL := vSQL || ' AND Fecha_Hora <= TIMESTAMP ''' || vHasta || ''' ';
                    END IF;
                    IF vFlagDoDeletePorEjecucionManual = 1 THEN
                        EXECUTE IMMEDIATE vSQL;
                    ELSE
                        SELECT fn_CubeGetPreLastExecute('profile') INTO NDesdePC FROM dual;
                        EXECUTE IMMEDIATE 'DELETE FROM d_profile WHERE d_profile.m_profile_id IN (SELECT m_profile_id FROM m_profile WHERE m_profile.datetime_pc >= TIMESTAMP ''' || TO_CHAR(NDesdePC, 'YYYY-MM-DD HH24:MI:SS') || ''')';
                    END IF;
                END IF;

                --INSERTO LOS NUEVOS VALORES
                vSQL := '';
                vSQL := 'INSERT INTO d_profile (';
                vSQL := vSQL || 'm_profile_id, ';
                vSQL := vSQL || 'Fecha_Hora, ';
                vSQL := vSQL || 'Año, ';
                vSQL := vSQL || 'Mes, ';
                vSQL := vSQL || 'Dia, ';
                vSQL := vSQL || 'Hora, ';
                vSQL := vSQL || 'Intervalo, ';
                vSQL := vSQL || 'Cliente, ';
                vSQL := vSQL || 'Ciudad, ';
                vSQL := vSQL || 'Punto_de_Medida, ';
                vSQL := vSQL || 'Medidor, ';
                vSQL := vSQL || 'log, ';
                vSQL := vSQL || 'Canal_Protocolo, ';
                vSQL := vSQL || 'Canal_Usuario, ';
                vSQL := vSQL || 'Unidad_Protocolo, ';
                vSQL := vSQL || 'Unidad_Usuario, ';
                vSQL := vSQL || 'Valor, ';
                vSQL := vSQL || 'Valor_Demanda, ';
                vSQL := vSQL || 'Valor_Editado, ';
                vSQL := vSQL || 'Valor_Factor ';
                vSQL := vSQL || vSQLADDI;
                vSQL := vSQL || ') ';

                CASE
                    WHEN (ArgTop IS NULL AND vDoRebuild = 1) THEN
                        SELECT max_reg_gen into vTop FROM d_cube_config WHERE main_filter = 'profile';
                    WHEN ArgTop > 0 THEN
                        vTop := ArgTop;
                    ELSE
                        SELECT max_reg_gen into vTop FROM d_cube_config WHERE main_filter = 'profile';
                END CASE;

                vSQL := vSQL || 'SELECT ';
                vSQL := vSQL || 'p.m_profile_id AS m_profile_id, ';
                vSQL := vSQL || 'p.meter_t0 AS Fecha_Hora, ';
                vSQL := vSQL || 'TO_CHAR(p.meter_t0, ''YYYY'') AS Año, ';
                vSQL := vSQL || 'TO_CHAR(p.meter_t0, ''MM'') AS Mes, ';
                vSQL := vSQL || 'TO_CHAR(p.meter_t0, ''DD'') AS Dia, ';
                vSQL := vSQL || 'TO_CHAR(p.meter_t0, ''HH24'') AS Hora, ';
                vSQL := vSQL || 'TO_CHAR(p.meter_t0, ''MI'') AS Intervalo, ';
                vSQL := vSQL || 'NVL(c.nombre, ''Indefinido'') AS Cliente, ';
                vSQL := vSQL || 'NVL(t.city, ''Indefinido'') AS Ciudad, ';
                vSQL := vSQL || 'NVL(l.name_meter_point, ''Indefinido'') AS Punto_de_Medida, ';
                vSQL := vSQL || 'm.meter_id AS Medidor, ';
                vSQL := vSQL || 'r.log AS Log, ';
                vSQL := vSQL || 'r.proto_descr AS Canal_Protocolo, ';
                vSQL := vSQL || 'NVL(f.prof_std_desc, ''Indefinido'') AS Canal_Usuario, ';
                vSQL := vSQL || 'NVL(p.raw_unit, ''Indefinido'') as \"Unidad Protocolo\", ';
                vSQL := vSQL || 'CASE WHEN u.descr = '''' OR u.descr IS NULL THEN ''Indefinido'' ELSE u.descr END AS Unidad_Usuario, ';
                vSQL := vSQL || 'p.val AS Valor, ';
                vSQL := vSQL || 'p.val_demand as Valor_Demanda, ';
                vSQL := vSQL || 'p.val_edit as Valor_Editado, ';
                vSQL := vSQL || 'p.val_factor as Valor_Factor ';
                vSQL := vSQL || vSQLSELF;
                vSQL := vSQL || 'FROM m_profile p ';
                vSQL := vSQL || 'INNER JOIN m_meters m ON p.meter_id = m.meter_id ';
                vSQL := vSQL || 'LEFT JOIN m_location_meters lm ON lm.meter_id = m.meter_id AND lm.active_date < p.meter_t0 AND (lm.deactiv_date IS NULL OR lm.deactiv_date = '''' OR lm.deactiv_date > p.meter_t0) ';
                vSQL := vSQL || 'LEFT JOIN m_location l ON l.id_meter_point = lm.id_meter_point ';
                vSQL := vSQL || 'LEFT JOIN c_customers c ON l.customer_id =  c.customer_id ';
                vSQL := vSQL || 'LEFT JOIN c_city t ON c.id_city = t.id ';
                vSQL := vSQL || 'INNER JOIN m_reg_desc_map r ON p.reg_descr_id = r.id ';
                vSQL := vSQL || 'LEFT JOIN m_prof_map f ON f.prof_app_id = r.app_id ';
                vSQL := vSQL || 'LEFT JOIN m_units u ON p.unit = u.descr ';
                vSQL := vSQL || 'LEFT JOIN m_meters_ud ud ON m.meter_id = ud.meter_id ';
                
                vSQL := vSQL || ' WHERE 1=1 AND ROWNUM <= ' || vTop || ' ';
            
                IF (NDesdePC IS NOT NULL) THEN
                    vSQL := vSQL || ' AND p.DATETIME_PC > TIMESTAMP ''' || TO_CHAR(NDesdePC, 'YYYY-MM-DD HH24:MI:SS') || ''' '; 
                END IF;
                IF (vDesde IS NOT NULL) THEN
                    vSQL := vSQL || ' AND p.METER_T0 >= TIMESTAMP ''' || vDesde || ''' ';
                END IF;
                IF (vHasta IS NOT NULL) THEN
                    vSQL := vSQL || ' AND p.METER_T0 <= TIMESTAMP ''' || vHasta || ''' ';
                END IF;
                EXECUTE IMMEDIATE vSQL;

                -- VERIFICO SI SE SOBREPASO EL LIMITE ESPECIFICADO DE TAMAÑO MAXIMO PARA TABLA CONSOLIDADA.
                -- DEBO EJECUTAR LA CONSULTA DE MANERA DINAMICA, YA QUE SI LA TABLA D_PROFILE NO EXISTE AL MOMENTO DE EJECUTARSE
                -- ESTE SP, POR MAS QUE LA MISMA SEA CREADA EN EL MISMO, ORACLE REPORTARÁ ERROR EN EL CODIGO FUENTE DEL SP
                SELECT max_saving_reg INTO vMaxReg FROM d_cube_config WHERE main_filter = 'profile';
                EXECUTE IMMEDIATE 'DELETE FROM d_profile WHERE rowid IN (SELECT rowid AS rid FROM (SELECT * FROM d_profile ORDER BY id ASC) where ROWNUM <= ((SELECT count(id) FROM d_profile) - ' || vMaxReg || ') AND ' || vMaxReg  ||  ' < (SELECT count(id) FROM d_profile))';
            END;
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
