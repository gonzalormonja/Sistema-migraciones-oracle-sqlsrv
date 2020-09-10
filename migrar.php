<?php
    $data = file_get_contents("configuracion.json");
    $data2 = json_decode($data,true);
    $dbs = [];
    $val = true;
    if(!$data2){
        echo "\nHAY PROBLEMAS CON EL ARCHIVO DE CONFIGURACION\n\n";
        die();
    }
    foreach($data2 as $d){
        $db = [
            'HOST' => strtolower($d['DB_HOST']),
            'DB' =>   ($d['DB_NAME']),
            'USER' => ($d['DB_USER']),
            'PORT' => ($d['DB_PORT']),
            'PASS' => ($d['DB_PASSWORD']),
            'ENGINE' => strtolower($d['ENGINE']),
            'SID' =>  isset($d['DB_ENV']) ? strtoupper($d['DB_ENV']) : '',
            'TYPE' => strtolower($d['TYPE'])
        ];
        validacion($db);
        $conexion = generarConexion($db);
        if($conexion!==true){
            $val=false;
        }else{
            $dbs[]=$db;
        }
    }
    if($val){
        echo "\nDATOS CORERECTOS\n\n";
        $dir = "Sistema-migraciones-oracle-sqlsrv/";
        $env = $dir.".env";
        $database = $dir."/database/migrations/";
        foreach($dbs as $d){
        //ARCHIVO DE CONFIGURACION
            echo "\nCOMENZANDO CONFIGURACION DE BASE DE DATOS ".$d['DB']."\n\n";
            $bd = $d['DB'];
            if(strtolower($d['ENGINE'])=="oci8"){
                $d['DB'] = $d['SID'];
                $d['ENGINE'] = "oracle";
            }elseif(strtolower($d['ENGINE'])=="mssql7"){
                $d['ENGINE'] = "sqlsrv";
            }
            $conf = 
            "
            APP_ENV=local

            DB_CONNECTION=".$d['ENGINE']."
            DB_HOST=".$d['HOST']."
            DB_PORT=".$d['PORT']."
            DB_DATABASE=".$d['DB']."
            DB_USERNAME=".$d['USER']."
            DB_PASSWORD=".$d['PASS']."
            ";
            $fp = fopen($env,"r+") or die("ocurrio un error");
            file_put_contents($env,$conf);
            echo "TERMINADA CONFIGURACION DE BASE DE DATOS ".$bd."\n\n";
        //FIN ARCHIVO CONFIGURACION

        //BORRAMOS ARCHIVOS ANTERIORES
            echo "\nLIMPIANDO SCRIPTS PARA BASE DE DATOS ".$bd."\n\n";
            $archivos= glob($database.'*.*');
            foreach ($archivos as $archivo){
                $archivo_borrar = $archivo;
                unlink($archivo_borrar);
            }
            echo "\nFIN LIMPIADO DE SCRIPTS PARA BASE DE DATOS ".$bd."\n\n";
        //FIN BORRADO ARCHIVOS ANTERIORES

        //PASO ARCHIVOS A CARPETA MIGRACION
            echo "\nOBTENIENDO SCRIPTS PARA BASE DE DATOS ".$bd."\n\n";
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
            echo "\nSCRIPTS OBTENIDOS CORRECTAMENTE PARA BASE DE DATOS ".$bd."\n\n";
        //FIN PASO ARCHIVOS A CARPETA MIGRACION

        //COMENZANDO MIGRACION
            echo "\nMIGRANDO BASE DE DATOS ".$bd."\n\n";
            $command = "cd Sistema-migraciones-oracle-sqlsrv/ && php artisan migrate";
            echo shell_exec($command);
        //MIGRACION TERMINADA
        }
    }else{
        echo "\nHAY ERRORES EN LA CONFIGURACION\n";
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
    function validacion($d){
        $val = true;
        if($d['ENGINE']!="oci8"&&$d['ENGINE']!="mssql7"){
            echo "\nENGINE NO ADMITIDO, VALORES POSIBLES: OCI8(ORACLE) O MSSQL7(SQLSERVER)\n\n";
            $val = false;
        }
        if($d['TYPE']!="client"&&$d['TYPE']!="master"){
            echo "\nTYPE NO ADMITIDO, VALORES POSIBLES: client O master\n\n";
            $val = false;
        }
        if($d['DB']==""){
            echo "\nEL NOMBRE DE LA BASE DE DATOS(DB_NAME) NO PUEDE ESTAR VACIO\n\n";
            $val = false;
        }
        if($d['USER']==""){
            echo "\nEL NOMBRE DEL USUARIO(DB_USER) NO PUEDE ESTAR VACIO\n\n";
            $val = false;
        }
        if($d['PASS']==""){
            echo "\nLA CONTRASEÑA(DB_PASSWORD) NO PUEDE ESTAR VACIO\n\n";
            $val = false;
        }
        if($d['HOST']==""){
            echo "\nEL HOST(DB_HOST) NO PUEDE ESTAR VACIO\n\n";
            $val = false;
        }
        if($d['PORT']==""){
            echo "\nEL PUERTO(DB_PORT) NO PUEDE ESTAR VACIO\n\n";
            $val = false;
        }
        if(!$val){
            die();
        }
    }
?>