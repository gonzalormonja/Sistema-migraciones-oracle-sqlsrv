<?php
$dir = "database\\migrations\\";
$dir2 = openDir($dir);
while ($elemento = readdir($dir2)){
    $aux = "";
    if( $elemento != "." && $elemento != ".."){
        $file = $dir.$elemento;
        $fp = fopen($file,"r+") or die("ocurrio un error");
        while ($linea = fgets($fp)) {
            $cadena_buscada = ", true);";
            $pos = strpos($linea,$cadena_buscada);
            if(!$pos===false){
                $nuevaCadena = substr($linea,0,$pos);
                $nuevaBusqueda = "\$table->integer('";
                $pos2 = strrpos($nuevaCadena,$nuevaBusqueda);
                if(!$pos2===false){
                    $pos2 = $pos2+17;
                    $clave = substr($nuevaCadena,$pos2,-1);
                    $espacios="";
                    for($i=0;$i<$pos2-17;$i++){
                        $espacios.=" ";
                    }
                    $aux .= "\n".$espacios."\$table->increments('$clave');\n";
                }
            }else{
                $cadena_buscada = "->onUpdate('NO ACTION')->onDelete('NO ACTION');";
                $pos = strpos($linea,$cadena_buscada);
                if(!$pos===false){
                    $nuevaCadena = substr($linea,0,$pos).";";
                    $aux .= "\n".$nuevaCadena;
                }else{
                    $aux.="\n".$linea;
                }
            }
        }
    }
    file_put_contents($file,$aux);
}
