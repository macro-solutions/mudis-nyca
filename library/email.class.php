<?php
class Email {

  public $mails;
  
  function __construct(){
    Zend_Loader_Autoloader::getInstance();

    // Conexion Imap
    $this->mails = new Zend_Mail_Storage_Imap(
    array(
              'host'     => EMAIL_SERVER,
              'port'     => '143',
              'user'     => EMAIL_ACCOUNT,
              'password' => EMAIL_PASSWORD,
    )
    );
  }
}