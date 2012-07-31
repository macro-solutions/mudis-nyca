<?php
include '../../models/login/Session.php';

if(isset($_POST['login'])){
  $usr = $_POST['login']['usr'];
  $pwd = $_POST['login']['pwd'];
  $pais = $_POST['login']['pais'];
  
  $session = new Session($usr,$pwd,$pais);
  echo $session->session;
}
?>