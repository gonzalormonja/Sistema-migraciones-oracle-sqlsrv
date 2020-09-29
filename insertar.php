<?php
require './Sistema-migraciones-oracle-sqlsrv/FlexibleArray.php';
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
    $conexion = generarConexion($db);

    //primero veo si es oracle o sqlsrv
    if($db['ENGINE'] == "mssql7"){
        //segundo veo si es master o client
        if($db['TYPE']=="client"){
            //tercero busco los scripts correspondientes en sus carpetas
            $dir = "Sistema-migraciones-oracle-sqlsrv/database/inserts/SQLSERVER/client/"; 
        }else{
            $dir = "Sistema-migraciones-oracle-sqlsrv/database/inserts/SQLSERVER/master/";
        }
        $archivos = scandir($dir);
        $aEjecutar = [];
        foreach($archivos as $archivo){
            //cuarto veo si estan en migracion de la bd
            if($archivo != "." && $archivo != ".."){
                $sql = "SELECT COUNT(*) AS TOT FROM migrations WHERE migration LIKE 'insersion_de_script_".$archivo."'";
                $resp = ejecutarConsulta($sql,$db,$conexion);
                if($resp[0]['TOT']==0){
                    $aEjecutar[] = $archivo;
                }
            }
        }
        //quinto migro los q sean necesarios
        foreach($aEjecutar as $archivo){
            $p = explode("-",$archivo);
            if($p[(count($p)-1)] == "EjecutaLineaLinea.sql"){
                sqlsrv_begin_transaction($conexion);
                $fp = fopen($dir.$archivo, "r");  
                $fileLines = array();
                $todoOk = true;
                while (!feof($fp)){
                    $sql = fgets($fp);
                    $stmt = sqlsrv_query($conexion,$sql);
                    if( $stmt === false ) {
                        $date = new DateTime();
                        $date = $date->format('Y-m-d H_i_s');
                        $fh = fopen('./logs/'.$date.'.txt','w') or die("Se produjo un error al crear el archivo");
                        $d = "\nFALLO AL EJECUTAR EL ARCHIVO ".$archivo." EN BASE DE DATOS ".$db['DB']."\n";
                        fwrite($fh, $d) or die("No se pudo escribir en el archivo");
                        fwrite($fh, getErrorSqlServer(sqlsrv_errors())) or die("No se pudo escribir en el archivo");
                        echo $d;
                        var_dump(sqlsrv_errors());
                        $todoOk=false;
                        sqlsrv_rollback($conexion);
                        die();
                    }
                } 
                fclose($fp);
                $sql = "INSERT INTO migrations(migration,batch)values(CONCAT('insersion_de_script_','".$archivo."'),1);";
                $stmt = sqlsrv_query($conexion,$sql);
                if( $stmt === false ) {
                    $date = new DateTime();
                    $date = $date->format('Y-m-d H_i_s');
                    $fh = fopen('./logs/'.$date.'.txt','w') or die("Se produjo un error al crear el archivo");
                    $d = "\nFALLO AL EJECUTAR EL ARCHIVO ".$archivo." EN BASE DE DATOS ".$db['DB']."\n";
                    fwrite($fh, $d) or die("No se pudo escribir en el archivo");
                    fwrite($fh, getErrorSqlServer(sqlsrv_errors())) or die("No se pudo escribir en el archivo");
                    echo $d;
                    var_dump(sqlsrv_errors());
                    $todoOk=false;
                    sqlsrv_rollback($conexion);
                    die();
                }
                if($todoOk){
                    echo "\nEJECUTADO CORRECTAMENTE ARCHIVO ".$archivo." EN BASE DE DATOS ".$db['DB']."\n";
                    sqlsrv_commit($conexion);
                }
            }else{
                $sqls = file_get_contents($dir.$archivo);
                $sqls = explode('/*cortoScript*/',$sqls);
                sqlsrv_begin_transaction($conexion);
                $todoOk = true;
                foreach($sqls as $sql){
                    $stmt = sqlsrv_query($conexion,$sql);
                    if( $stmt === false ) {
                        $date = new DateTime();
                        $date = $date->format('Y-m-d H_i_s');
                        $fh = fopen('./logs/'.$date.'.txt','w') or die("Se produjo un error al crear el archivo");
                        $d = "\nFALLO AL EJECUTAR EL ARCHIVO ".$archivo." EN BASE DE DATOS ".$db['DB']."\n";
                        fwrite($fh, $d) or die("No se pudo escribir en el archivo");
                        fwrite($fh, getErrorSqlServer(sqlsrv_errors())) or die("No se pudo escribir en el archivo");
                        echo $d;
                        var_dump(sqlsrv_errors());
                        $todoOk=false;
                        sqlsrv_rollback($conexion);
                        die();
                    }
                    //ahora quedaria insertar el archivo migrado en migraciones, pero por facilidades propias eso lo ejecutara diractamente el script
                }
                $sql = "INSERT INTO migrations(migration,batch)values(CONCAT('insersion_de_script_','".$archivo."'),1);";
                $stmt = sqlsrv_query($conexion,$sql);
                if( $stmt === false ) {
                    $date = new DateTime();
                    $date = $date->format('Y-m-d H_i_s');
                    $fh = fopen('./logs/'.$date.'.txt','w') or die("Se produjo un error al crear el archivo");
                    $d = "\nFALLO AL EJECUTAR EL ARCHIVO ".$archivo." EN BASE DE DATOS ".$db['DB']."\n";
                    fwrite($fh, $d) or die("No se pudo escribir en el archivo");
                    fwrite($fh, getErrorSqlServer(sqlsrv_errors())) or die("No se pudo escribir en el archivo");
                    echo $d;
                    var_dump(sqlsrv_errors());
                    $todoOk=false;
                    sqlsrv_rollback($conexion);
                    die();
                }
                if($todoOk){
                    echo "\nEJECUTADO CORRECTAMENTE ARCHIVO ".$archivo." EN BASE DE DATOS ".$db['DB']."\n";
                    sqlsrv_commit($conexion);
                }
            }
        }
    }else{

    }
    sqlsrv_close($conexion);
}


function getErrorSqlServer($err){
    $resp = "";
    foreach($err as $er){
        foreach($er as $i=>$e){
            if(!intval($i) && $i!="0"){
                $resp.="\n".$i.":   ".$e;
            }
        }
    }
    return $resp;
}
function ejecutarConsulta($sql,$db,$conn){
    if($db['ENGINE']=="mssql7"){
        $resp = sqlsrv_getall(sqlsrv_query($conn,$sql));
    }else{
        $sql2 = "alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss'";
        $resultOrigen = oci_exec($conn,$sql2);
        $resp = oci_exec($conn,$sql);
    }
    //return new FlexibleArray($resp);
    return $resp;
}
function sqlsrv_getall($result) {
    $ret = [];
    while ($row = sqlsrv_fetch_array($result)) {
        $ret[] = $row;
    }
    return $ret;
}
function oci_exec($conn, $query, $dieOnError = true) {
    $stmt = oci_parse($conn, $query);
    $result = oci_execute($stmt);
    if ($result === false && $dieOnError) {
        return false;
    }
    if ($stmt) {
        $res = [];
        @oci_fetch_all($stmt, $res, 0, -1, OCI_FETCHSTATEMENT_BY_ROW + OCI_ASSOC);
        if (count($res)) {
            return $res;
        }
        return false;
    }
    return false;
}
function generarConexion($db){
    if(!isset($db['PORT'])){
        if($db['ENGINE']=="mssql7"){
            $db['PORT']=1433;
        }else{
            $db['PORT']=1521;
        }
    }
    $connectionInfo = array("Database" => $db['DB'], "UID" => $db['USER'], "PWD" => $db['PASS'],
    "ReturnDatesAsStrings" => true, "CharacterSet" => "UTF-8");
    if($db['ENGINE']=="mssql7"){
        $sidSql=null;
        if(isset($db['sid'])){
            if($db['sid']!=""){
                $sidSql="\\".$db['sid'];
            }
        }   
        $dbConn = sqlsrv_connect($db['HOST'].','.$db['PORT'].$sidSql, $connectionInfo);
    }else{
        $dbConn = oci_connect($db['USER'], $db['PASS'], $db['HOST'].':'.$db['PORT'].'/'.$db['SID'], 'AL32UTF8');
    }
    return $dbConn;
}

