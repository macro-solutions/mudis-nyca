<?php
/**
 * Modelo de para el modulo de cobranza
 * @author cfernandez
 *
 */
class Cobranza
{
  
/**
 * 
 * Lee y extrae la información de todos los correos de pedidos existentes en el servidor
 * @return array() Todos los correos existentes formateados en un array 
 */
  public static function getEmails(){
    $emails = new Email();

    foreach ($emails->mails as $message) {
      if (strrpos(strtolower($message->subject),'tus datos de compra (') === 0) {
        $parsedEmail = self::parseEmail($message);
        $order[] = self::readEmail($parsedEmail);
      }
    }
    return $order;
  }
  
/**
 * 
 * Lee el contenido de cada correo, elimina contendio innecesario y le da un formato adecuado al HTML
 * @param object $message Correo individual para ser parseado
 * @return string $parsedEmail Contenido de correo en formato HTML
 */
  private static function parseEmail($message){
    $message = $message->getContent();

    $message = str_replace("\r\n",'',$message); //salto de linea
    $message = str_replace( '=20', ' ', $message );//espacio
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

    $posStart = strrpos($message, '<head>');
    $message = substr($message, $posStart, -37);

    $parsedEmail = '<html>';
    $parsedEmail .= $message;
    $parsedEmail .= '</html>';

    return $parsedEmail;
  }

  /**
   * 
   * Lee el correo en formato HTML para la extracción de la información del pedido
   * @param string $parsedEmail correo en formato HTML
   * @return array() Información del correo con el detalle ordenado del pedido y producto
   */
  private static function readEmail($parsedEmail){
    $order = array();
    $producto = array();

    $html = new simple_html_dom();

    $html->load($parsedEmail);
    $buyerData = $html->find('th[style=font-weight:normal; color:#6D6D6D;]');
    $shippingData = $html->find('tr[style=font-size:11px; font-family:Arial; color:#212121; font-weight:bold;] th[!width]');
    $products = self::buildProducts($html->find('table[bgcolor=#F8F8F8]')); //lista impar del producto
    $products = self::buildProducts($html->find('table[bgcolor=#FFFFFF]'),$products); //lista par del producto
    $order = array(
      'nombre'=>$buyerData[0]->plaintext,
      'apellidos'=>$buyerData[1]->plaintext,
      'email'=>$buyerData[2]->plaintext,
    	'direccion'=>$buyerData[5]->plaintext . ' ' . $buyerData[6]->plaintext,
    	'ciudad'=>$buyerData[7]->plaintext,
    	'region'=>$buyerData[8]->plaintext,
    	'provincia'=>$buyerData[9]->plaintext,
    	'pais'=>$buyerData[10]->plaintext,
    	'telefono'=>$buyerData[0]->plaintext,
    	'formaPago'=>$shippingData[0]->plaintext,
    	'envio'=>$shippingData[1]->plaintext,
    	'total'=>trim($message = str_replace(MONEDA,'',$html->find('table[height=50] tbody tr td',1)->plaintext)),
    	'productos'=>$products
    );
    return $order;
  }

  /**
   * 
   * Arma el array de productos por correo
   * @param object $html objeto de la clase Email()
   * @param array() $products Información del correo con el detalle ordenado del producto, para agregarle uno adicional
   * @return array()  $products Información del correo con el detalle ordenado del producto
   */
  private static function buildProducts($html,$products = array()){
    foreach($html as $el){
      $data['modelo'] = $el->find('tr td',0)->find('span',0)->plaintext;
      $data['dispositivo'] = str_replace('Dispositivo: ', '',$el->find('tr td',0)->find('p',0)->plaintext);
      $data['cantidad'] =  str_replace('Cantidad: ', '',$el->find('tr td',1)->find('span',0)->plaintext);
      $data['precio'] =  trim($message = str_replace(array(MONEDA,'Subtotal: '), '',$el->find('tr td',1)->find('span',1)->plaintext));
      $products[] = $data;
    }

    return $products;
  }

}