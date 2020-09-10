<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProcedureSpGenCUbeEvents extends Migration
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
            $sql="CREATE  PROCEDURE [dbo].[sp_GenCubeEvents]
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
                            SET @fexist = (select COUNT(object_id) from sys.columns where object_id = object_id('d_events') and name = @ud_name)
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
                            DROP TABLE IF EXISTS d_events
                            
                            SET @SQL = 'CREATE TABLE d_events ( '
                            SET @SQL += '	Id bigint IDENTITY(1,1) NOT NULL, '
                            SET @SQL += '	m_event_id int NOT NULL, '
                            SET @SQL += '	Fecha_Hora datetime NOT NULL, '
                            SET @SQL += '	Año int NOT NULL, '
                            SET @SQL += '	Mes int NOT NULL, '
                            SET @SQL += '	Dia int NOT NULL, '
                            SET @SQL += '	Hora int NOT NULL, '
                            SET @SQL += '	Cliente varchar(100) NOT NULL, '
                            SET @SQL += '	Ciudad varchar(100) NOT NULL, '
                            SET @SQL += '	Punto_de_Medida varchar(50) NOT NULL, '
                            SET @SQL += '	Medidor varchar(50) NOT NULL, '
                            SET @SQL += '	Concentrador varchar(50) NOT NULL, '
                            SET @SQL += '	Evento_Protocolo varchar(100) NOT NULL, '
                            SET @SQL += '	Evento_Usuario varchar(100) NOT NULL, '
                            SET @SQL += '	Grupo_Evento varchar(100) NOT NULL, '
                            SET @SQL += @SQLADDF
                            SET @SQL += 'CONSTRAINT PK_d_events PRIMARY KEY NONCLUSTERED (Id ASC), '
                            SET @SQL += 'CONSTRAINT UK_m_event_id UNIQUE NONCLUSTERED (m_event_id ASC), '
                            SET @SQL += 'CONSTRAINT UK_d_events UNIQUE NONCLUSTERED ( '
                            SET @SQL += '	Id ASC, '
                            SET @SQL += '	m_event_id ASC, '
                            SET @SQL += '	Fecha_Hora ASC, '
                            SET @SQL += '	Año ASC, '
                            SET @SQL += '	Mes ASC, '
                            SET @SQL += '	Dia ASC, '
                            SET @SQL += '	Hora ASC, '
                            SET @SQL += '	Cliente ASC, '
                            SET @SQL += '	Ciudad ASC, '
                            SET @SQL += '	Punto_de_Medida ASC, '
                            SET @SQL += '	Medidor ASC, '
                            SET @SQL += '	Concentrador ASC, '
                            SET @SQL += '	Evento_Protocolo ASC, '
                            SET @SQL += '	Evento_Usuario ASC, '
                            SET @SQL += '	Grupo_Evento '
                            SET @SQL += @SQLADDI
                            SET @SQL += '))'
                    
                            --print 'SQL 1: ' + @SQL
                            exec sp_executesql @SQL, @Params
                            CREATE CLUSTERED INDEX IX_de_Fecha_Hora ON d_events (Fecha_Hora);
                            CREATE NONCLUSTERED INDEX IX_de_Año ON d_events (Año);
                            CREATE NONCLUSTERED INDEX IX_de_Mes ON d_events (Mes);
                            CREATE NONCLUSTERED INDEX IX_de_Dia ON d_events (Dia);
                            CREATE NONCLUSTERED INDEX IX_de_Cliente ON d_events (Cliente);
                            CREATE NONCLUSTERED INDEX IX_de_Punto_de_Medida ON d_events (Punto_de_Medida);
                            CREATE NONCLUSTERED INDEX IX_de_Medidor ON d_events (Medidor);
                        END
                    
                        --GESTION DE FECHAS PARA REGISTROS A CONSOLIDAR
                        DECLARE @NDesdePC datetime
                        DECLARE @NDesde varchar(8)
                        SET @NDesde = @Desde
                        --SI NO SE INGRESA FECHA DESDE Y SE INDICA REBUILD, BUSCO EL 'DESDE' SETEADO POR PARAMETRO 
                        IF (@Desde = '' AND @Rebuild = '1') BEGIN
                            DECLARE @from datetime
                            SET @NDesde = dbo.fn_CubeGetFromGen ('event')
                        END
                    
                        --SI SE CONSIDERA EL INGRESO DE UN RANGO DE FECHAS ELIMINO LO QUE ESTA CARGADO EN LA TABLA PARA CUBO EN EL RANGO DE FECHAS A GENERAR
                        IF (@NDesde <> '' OR @Hasta <> '') BEGIN
                            SET @SQL = 'DELETE d_events where 1 = 1 '
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
                            SET @NDesdePC = dbo.fn_CubeGetPreLastExecute ('event')
                            --ELIMINO POSIBLES REGISTROS DENTRO DEL CUBO QUE DEBAN SER ELIMINADOS (FUERON MODIFICADOS EN m_event)
                            DELETE d_events FROM m_event WHERE d_events.m_event_id = m_event.m_event_id and m_event.datetime_pc >= @NDesdePC
                        END
                    
                    
                        --INSERTO LOS NUEVOS VALORES
                        SET @SQL = 'INSERT INTO d_events ('
                        SET @SQL += 'm_event_id, '
                        SET @SQL += 'Fecha_Hora, '
                        SET @SQL += 'Año, '
                        SET @SQL += 'Mes, '
                        SET @SQL += 'Dia, '
                        SET @SQL += 'Hora, '
                        SET @SQL += 'Cliente, '
                        SET @SQL += 'Ciudad, '
                        SET @SQL += 'Punto_de_Medida, '
                        SET @SQL += 'Medidor, '
                        SET @SQL += 'Concentrador, '
                        SET @SQL += 'Evento_Protocolo, '
                        SET @SQL += 'Evento_Usuario, '
                        SET @SQL += 'Grupo_Evento '
                        SET @SQL += @SQLSELN
                        SET @SQL += ') '
                    
                        IF (@Top = '' AND @Rebuild = 1) BEGIN
                            SELECT @Top = max_reg_gen FROM d_cube_config WHERE main_filter = 'event'
                        END ELSE
                        IF (@Top > 0) BEGIN 
                            SET @Top = @Top
                        END ELSE BEGIN
                            SELECT @Top = max_reg_day_exec FROM d_cube_config WHERE main_filter = 'event'
                        END
                    
                        SET @SQL += 'SELECT TOP ' + CAST(@Top as varchar) + ' '	
                        SET @SQL += 'e.m_event_id AS ''m_event_id'', '
                        SET @SQL += 'e.meter_t AS ''Fecha_Hora'', '
                        SET @SQL += 'year(e.meter_t) AS ''Año'', '
                        SET @SQL += 'month(e.meter_t) AS ''Mes'', '
                        SET @SQL += 'day(e.meter_t) AS ''Dia'', '
                        SET @SQL += 'datepart(hour, e.meter_t) AS ''Hora'', '
                        SET @SQL += 'isnull(c.nombre, ''Indefinido'') AS ''Cliente'', '
                        SET @SQL += 'isnull(t.city, ''Indefinido'') AS ''Ciudad'', '
                        SET @SQL += 'isnull(l.name_meter_point, ''Indefinido'') AS ''Punto_de_Medida'', '
                        SET @SQL += 'm.meter_id AS ''Medidor'', '
                        SET @SQL += 'e.cnc_id AS ''Concentrador'', '
                        SET @SQL += 'CASE WHEN d.group_id = ''-1'' OR d.group_id IS NULL OR d.group_id = '''' THEN d.proto_descr ELSE (SELECT ISNULL(MAX(l.description), ''Indefinido'') FROM m_event_list l WHERE l.id_ev = d.rep_ev_id) END AS ''Evento_Protocolo'', '
                        SET @SQL += 'CASE WHEN v.ev_std_desc = '''' OR v.ev_std_desc IS NULL THEN ''Indefinido'' ELSE v.ev_std_desc END AS ''Evento_Usuario'', '
                        SET @SQL += 'CASE WHEN d.group_id = ''-1'' OR d.group_id IS NULL OR d.group_id = '''' THEN ''Indefinido'' ELSE (SELECT MAX(g.name_ev_gp) FROM m_event_group g WHERE g.id_ev_gp = d.group_id) END AS ''Grupo_Evento'' '
                        
                        --AGREGO EN EL SELECT LOS CAMPOS DE USUARIO
                        SET @SQL += @SQLSELF
                        SET @SQL += 'FROM m_event e '
                        SET @SQL += 'INNER JOIN m_meters m ON e.meter_id = m.meter_id '
                        SET @SQL += 'LEFT JOIN m_location_meters lm ON lm.meter_id = m.meter_id AND lm.active_date < e.meter_t AND (lm.deactiv_date IS NULL OR lm.deactiv_date = '''' OR lm.deactiv_date > e.meter_t) '
                        SET @SQL += 'LEFT JOIN m_location l ON l.id_meter_point = lm.id_meter_point '
                        SET @SQL += 'LEFT JOIN c_customers c ON l.customer_id =  c.customer_id '
                        SET @SQL += 'LEFT JOIN c_city t ON c.id_city = t.id '
                        SET @SQL += 'INNER JOIN m_ev_desc_map d ON e.event_id = d.id '
                        SET @SQL += 'LEFT JOIN m_ev_map v ON v.ev_app_id = d.app_id '
                        SET @SQL += 'LEFT JOIN m_meters_ud ud ON m.meter_id = ud.meter_id '
                        
                        SET @SQL += 'WHERE 1=1 '
                        IF (@NDesdePC IS NOT NULL) BEGIN
                            SET @SQL += 'AND e.datetime_pc > @PC '
                        END
                        IF (@NDesde <> '') BEGIN
                            SET @SQL += 'AND e.meter_t >= ''' + @NDesde + ''' '
                        END
                        IF (@Hasta <> '') BEGIN
                            SET @SQL += 'AND e.meter_t <= ''' + @Hasta + ''' '
                        END
                    
                        --print 'SQL 3: ' + @SQL
                        exec sp_executesql @SQL, N'@PC datetime', @PC = @NDesdePC
                        
                        --VERIFICO SI SE SOBREPASO EL LIMITE ESPECIFICADO DE TAMAÑO MAXIMO PARA TABLA CONSOLIDADA
                        DECLARE @maxreg INT
                        DECLARE @curreg INT
                        SET @maxreg = (SELECT max_saving_reg FROM d_cube_config WHERE main_filter = 'event')
                        SET @curreg = (SELECT COUNT(Id) FROM d_events)
                        IF @maxreg < @curreg BEGIN
                            DECLARE @topreg INT
                            SET @topreg = @curreg - @maxreg
                            SET @SQL = 'DELETE FROM d_events WHERE Id IN (SELECT TOP ' + CAST(@topreg as varchar) + ' Id FROM d_events ORDER BY Id asc)'
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
