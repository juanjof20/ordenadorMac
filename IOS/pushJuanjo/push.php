<?php

$deviceToken = $_GET['TokenPush'];  // Token Device
$number = isset($_GET['numberNot']) ? $_GET['numberNot'] : 8;  // Number of notifications
$message = isset($_GET['message']) ? $_GET['message'] : "Push de prueba desde Qastusoft.com.es";   // Message to show the user

// TOKEN PUSH :


	echo 'SSOO iOS' . PHP_EOL;
    
    //Parámetros
    $pem_file       = 'fulcert.pem';
    $pem_secret     = 'qwerasdf';
    $apns_topic     = 'es.estech.pushtest24';

    //Configuración de alerta

       $alert = "{\"aps\":{\"badge\":" . $number . ",\"alert\":\"$message\",\"sound\":\"default\"}}";

    //URL producción
//      $url = "https://api.push.apple.com/3/device/$deviceToken";
    //URL testing
  $url = "https://api.development.push.apple.com/3/device/$deviceToken";

    // OPEN CONNECTION TO APNS SERVER :

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);     
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $alert);
    curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_2_PRIOR_KNOWLEDGE );
    curl_setopt($ch, CURLOPT_HTTPHEADER, array("apns-topic: $apns_topic"));
    curl_setopt($ch, CURLOPT_SSLCERT, $pem_file);
    curl_setopt($ch, CURLOPT_SSLCERTPASSWD, $pem_secret);
    $response = curl_exec($ch);
    $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    var_dump($response);
    var_dump($httpcode);



?>
