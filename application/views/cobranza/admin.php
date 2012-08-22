<?php
echo "<pre>";
print_r($mail);
echo "</pre>";
// foreach ($mail as $message){
//   $html = new simple_html_dom();
//   $html->load($message);
//   $comprador = $html->find('th[style=font-weight:normal; color:#6D6D6D;]');
//   $pagoEnvio = $html->find('tr[style=font-size:11px; font-family:Arial; color:#212121; font-weight:bold;] th[!width]');
//   $producto = array();
//   $productos = array();
//   foreach($html->find('table[bgcolor=#F8F8F8]') as $pedido){
//     $producto['modelo'] = $pedido->find('tr td',0)->find('span',0)->plaintext;
//     $producto['dispositivo'] = str_replace('Dispositivo: ', '',$pedido->find('tr td',0)->find('p',0)->plaintext);
//     $producto['cantidad'] =  str_replace('Cantidad: ', '',$pedido->find('tr td',1)->find('span',0)->plaintext);
//     $producto['precio'] =  trim($message = str_replace(array(MONEDA,'Subtotal: '), '',$pedido->find('tr td',1)->find('span',1)->plaintext));
//   }
//   $productos[] = $producto;
//   foreach($html->find('table[bgcolor=#FFFFFF]') as $pedido){
//     $producto['modelo'] = $pedido->find('tr td',0)->find('span',0)->plaintext;
//     $producto['dispositivo'] = str_replace('Dispositivo: ', '',$pedido->find('tr td',0)->find('p',0)->plaintext);
//     $producto['cantidad'] =  str_replace('Cantidad: ', '',$pedido->find('tr td',1)->find('span',0)->plaintext);
//     $producto['precio'] =  trim($message = str_replace(MONEDA, '',$pedido->find('tr td',1)->find('span',1)->plaintext));
    
//   }
//   $productos[] = $producto;
  //   echo $total = $html->find('table[height=50] tbody tr td',1)->plaintext;
  //   echo $total= $total[1]->plaintext;
  //   echo $pago = $pagoEnvio[0]->plaintext;
  //   echo $envio = $pagoEnvio[1]->plaintext;
  //   echo $nombre =  $comprador[0]->plaintext;
  //   echo $apellido =  $comprador[1]->plaintext;
  //   echo $correo =  $comprador[2]->plaintext;
  //   echo $direccion1 =  $comprador[5]->plaintext;
  //   echo $direccion2 =  $comprador[6]->plaintext;
  //   echo $ciudad =  $comprador[7]->plaintext;
  //   echo $region =  $comprador[8]->plaintext;
  //   echo $provincia =  $comprador[9]->plaintext;
  //   echo $pais =  $comprador[10]->plaintext;
  //   echo $tel =  $comprador[11]->plaintext;

// }
// echo "<pre>";
// print_r($productos);
// echo "</pre>";
