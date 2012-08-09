<?php
class LoginController extends Controller{
  
  function login(){
    if(isset($_POST['login'])){
      $usr = $_POST['login']['usr'];
      $pwd = $_POST['login']['pwd'];
      $pais = $_POST['login']['pais'];

      $session = new Session($usr,$pwd,$pais);
      if($session->session && $_SESSION['user']){
        header('location: ' . BASE_PATH . '/cobranza/admin');
        exit;
      }else{
        $this->set('error','Usuario y/o Contraseña Incorrectos');
      }
    }
    $this->set('title','Mudis Nyca CRM - Login');
  }
}