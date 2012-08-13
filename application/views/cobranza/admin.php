<?php

foreach ($mail->mails as $messageNum=>$message) {
  if (stripos(strtolower($message->subject),'tus datos de compra (') !== false) {
    readMail($messageNum,$message);
  }

}

function readMail($messageNum,$message){
  $message = $message->getContent();
  $message = str_replace( '=20', ' ', $message );
  $message = str_replace( '=', '', $message );
  $message = str_replace( '3D', '=', $message );
  $message = str_replace( 'C3A1', 'á', $message );
  $message = str_replace( 'C3A9', 'é', $message );
  $message = str_replace( 'C3AD', 'í', $message );
  $message = str_replace( 'C3B3', 'ó', $message );
  $message = str_replace( 'C3BA', 'ú', $message );
  $message = str_replace( 'C381', 'Á', $message );
  $message = str_replace( 'C389', 'É', $message );
  $message = str_replace( 'C38D', 'Í', $message );
  $message = str_replace( 'C393', 'Ó', $message );
  $message = str_replace( 'C39A', 'Ú', $message );
  $message = str_replace( 'C3B1', 'ñ', $message );
  $message = str_replace( 'C391', 'Ñ', $message );
  $message = str_replace("\r\n",'',$message);


  $text = "";
  $posStart = strrpos($message, '<head>');
  $htmlStr = '<html>';
  $htmlStr .= $message = substr($message, $posStart, -37);
  $htmlStr .= '</html>';
  echo $htmlStr;
  $html = new simple_html_dom();
  $html->load($htmlStr);
  $comprador = $html->find('th[style=font-weight:normal; color:#6D6D6D;]');
  $pagoEnvio = $html->find('tr[style=font-size:11px; font-family:Arial; color:#212121; font-weight:bold;] th[!width]');
  $mudis = $html->find('table[bgcolor=#F8F8F8] tbody tr td',0)->find('span',0);
  $dispositivo = $html->find('table[bgcolor=#F8F8F8] tbody tr td',0)->find('p',0);
  $cantidad = $html->find('table[bgcolor=#F8F8F8] tbody tr td',1)->find('span',0);
  $subtotal = $html->find('table[bgcolor=#F8F8F8] tbody tr td',1)->find('span',1);
  $total = $html->find('table[height=50] tbody tr td');
  $total= $total[1];
  $pago = $pagoEnvio[0];
  $envio = $pagoEnvio[1];
  $nombre =  $comprador[0];
  $apellido =  $comprador[1];
  $correo =  $comprador[2];
  $direccion1 =  $comprador[5];
  $direccion2 =  $comprador[6];
  $ciudad =  $comprador[7];
  $region =  $comprador[8];
  $provincia =  $comprador[9];
  $pais =  $comprador[10];
  $tel =  $comprador[11];

}

