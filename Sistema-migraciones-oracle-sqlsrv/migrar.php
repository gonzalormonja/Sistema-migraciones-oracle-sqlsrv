<?php
    $data = file_get_contents("configuracion.json");
    $data2 = json_decode($data,true);
    $dbs = [];
    $val = true;
    foreach($data2 as $d){
        $db = [
            'HOST' => $d['DB_HOST'],
            'DB' =>   $d['DB_NAME'],
            'USER' => $d['DB_USER'],
            'PORT' => $d['DB_PORT'],
            'PASS' => $d['DB_PASSWORD'],
            'ENGINE' => $d['ENGINE'],
            'SID' =>  isset($d['DB_ENV']) ? $d['DB_ENV'] : '',
            'TYPE' => $d['TYPE']
        ];
        $conexion = generarConexion($db);
        if($conexion!==true){
            $val=false;
        }else{
            $dbs[]=$db;
        }
    }
    if($val){
        echo "DATOS CORERECTOS\n\n";
        $dir = "";
        $env = $dir.".env";
        $database = $dir."database/migrations/";
        foreach($dbs as $d){
        //ARCHIVO DE CONFIGURACION
            echo "COMENZANDO CONFIGURACION DE BASE DE DATOS ".$d['DB']."\n\n";
            if(strtolower($d['ENGINE'])=="oci8"){
                $d['DB'] = $d['SID'];
            }
            $conf = 
            "
            DB_CONNECTION=".$d['ENGINE']."
            DB_HOST=".$d['HOST']."
            DB_PORT=".$d['PORT']."
            DB_DATABASE=".$d['DB']."
            DB_USERNAME=".$d['USER']."
            DB_PASSWORD=".$d['PASS']."
            ";
            $fp = fopen($env,"r+") or die("ocurrio un error");
            file_put_contents($env,$conf);
            echo "TERMINADA CONFIGURACION DE BASE DE DATOS ".$d['DB']."\n\n";
        //FIN ARCHIVO CONFIGURACION

        //BORRAMOS ARCHIVOS ANTERIORES
            echo "LIMPIANDO SCRIPTS PARA BASE DE DATOS ".$d['DB']."\n\n";
            $archivos= glob($database.'*.*');
            foreach ($archivos as $archivo){
                $archivo_borrar = $archivo;
                unlink($archivo_borrar);
            }
            echo "FIN LIMPIADO DE SCRIPTS PARA BASE DE DATOS ".$d['DB']."\n\n";
        //FIN BORRADO ARCHIVOS ANTERIORES

        //PASO ARCHIVOS A CARPETA MIGRACION
            echo "OBTENIENDO SCRIPTS PARA BASE DE DATOS ".$d['DB']."\n\n";
            if(strtolower($d['TYPE'])=='master'){
                $dirScripts = $dir."database/migrationsMaster/";
            }else{
                $dirScripts = $dir."database/migrationsClient/";
            }
            
            $archivos= glob($dirScripts.'*.*');
            foreach ($archivos as $archivo){
                $archivo_copiar= str_replace($dirScripts, $database, $archivo);
                copy($archivo, $archivo_copiar);
            }
            echo "SCRIPTS OBTENIDOS CORRECTAMENTE PARA BASE DE DATOS ".$d['DB']."\n\n";
        //FIN PASO ARCHIVOS A CARPETA MIGRACION

        //COMENZANDO MIGRACION
            $command = "php artisan migrate";
            echo runDetached($command);
        //MIGRACION TERMINADA
        }
    }else{
        echo "HAY ERRORES EN LA CONFIGURACION\n";
    }






    function generarConexion($db){
        if(!isset($db['PORT'])){
            if($db['ENGINE']=="mssql7" || $db['ENGINE']=="mssql" || $db['ENGINE']=="sqlserver"){
                $db['PORT']=1433;
            }else{
                $db['PORT']=1521;
            }
        }
        $connectionInfo = array("Database" => $db['DB'], "UID" => $db['USER'], "PWD" => $db['PASS'],
        "ReturnDatesAsStrings" => true, "CharacterSet" => "UTF-8");
        if($db['ENGINE']=="mssql7" || $db['ENGINE']=="mssql" || $db['ENGINE']=="sqlserver"){
            $sidSql=null;
            if(isset($db['sid'])){
                if($db['sid']!=""){
                    $sidSql="\\".$db['sid'];
                }
            }   
            $dbConn = sqlsrv_connect($db['HOST'].','.$db['PORT'].$sidSql, $connectionInfo);
            if($dbConn){
                return true;
            }else{
                $errores = sqlsrv_errors();
                $problem = [];
                foreach($errores as $err){
                    if($err['code']==258){
                        $problem[] = ["problemServidor",4];
                    }elseif($err['code']==18456){
                        $problem[] = ["problemUsuario",1];
                    }elseif($err['code']==4060){
                        $problem[] = ["problemBD",2];
                    }elseif($err['code']==-1){
                        $problem[] = ["problemInstance",3];
                    }
                }
                if(count($problem)==1){
                    return ($problem[0][0]);
                }elseif($problem>1){
                    $tmp = [];
                    for($i=0;$i<count($problem)-1;$i++){
                        for($y=$i;$y<count($problem);$y++){
                            if($problem[$y][1]>$problem[$i][1]){
                                $tmp = $problem[$i];
                                $problem[$i]=$problem[$y];
                                $problem[$y]=$tmp;
                            }
                        }
                    }
                    return ($problem[0][0]);
                }else{
                    return ("errorDesconocido");
                }
            }
        }else{
            $dbConn = oci_connect($db['USER'], $db['PASS'], $db['HOST'].':'.$db['PORT'].'/'.$db['SID'], 'AL32UTF8');
            if($dbConn){
                return true;
            }else{
                $errores = oci_error();
                $problem = [];
                //foreach($errores as $err){
                if($errores['code']==12170){
                    $problem[] = ["problemServidor",4];
                }elseif($errores['code']==1017){
                    $problem[] = ["problemUsuario",1];
                }elseif($errores['code']==1017){
                    $problem[] = ["problemBD",2];
                }elseif($errores['code']==12514){
                    $problem[] = ["problemInstance",3];
                }
                
                if(count($problem)==1){
                    return ($problem[0][0]);
                }elseif($problem>1){
                    $tmp = [];
                    for($i=0;$i<count($problem);$i++){
                        for($y=$i;$y<=count($problem);$y++){
                            if($problem[$y][1]>$problem[$i][1]){
                                $tmp = $problem[$i];
                                $problem[$i]=$problem[$y];
                                $problem[$y]=$tmp;
                            }
                        }
                    }
                    return ($problem[0][0]);
                }else{
                    return ("errorDesconocido");
                }
            }
        }
    }


    function runDetached($command, $outputFilePath = '/dev/null') {
        if ($outputFilePath !== '/dev/null') {
            $outputFilePath = '"' . $outputFilePath . '"';
        }
        $full_command = "$command";
        return shell_exec($full_command);
    }
?>