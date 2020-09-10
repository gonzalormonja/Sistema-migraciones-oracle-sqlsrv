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
