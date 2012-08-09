<?php
class Session {

  private $usr;
  private $pwd;
  private $pais;
  public $session;

  function __construct($usr = "",$pwd = "",$pais = ""){
    session_start();
    if($usr && $pwd && $pais){
      $this->usr   = $usr;
      $this->pwd   = md5($pwd);
      $this->pais  = $pais;
      $this->loginCheck();
    }
    $this->sessionCheck();
  }

  private function loginCheck(){
    $db = MySql::getInstance();
    $sql = "SELECT CONCAT(nombre,' ',aPaterno,' ',aMaterno) as nombre,
    								usuario,
    								password,
    								p.idPais,
                    p.pais
            FROM 
                usuarios u 
            JOIN 
                paises p ON u.idPais = p.idPais
            WHERE 
                usuario = '$this->usr' 
                and password = '$this->pwd' 
                and p.idPais = $this->pais";
    $db->setQuery($sql);
    $datos = $db->loadObject();
    if($datos){
      if($datos->usuario === $this->usr && $datos->password === $this->pwd && $datos->idPais === $this->pais){
        unset($datos->password);
        $_SESSION['user'] = $datos;
        $this->session = true;
      }else{
        $this->session = false;
      }
    }else{
      $this->session = false;
    }
  }

  private function sessionCheck(){
    if(isset($_SESSION['user'])){
      $this->session = true;
    }else{
      $this->session = false;
      session_destroy();
      //header('location: ../../login/?e=1');
    }
  }
}