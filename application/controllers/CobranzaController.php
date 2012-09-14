<?php
/**
 *
 * Controller del modulo de cobranza
 * @author cfernandez
 *
 */
class CobranzaController extends Controller
{

  function admin(){
    $mail = Cobranza::getEmails();
    $this->set('title','Mudis Nyca CRM - Cobranza',false);
    $this->set('mail',$mail,false);
  }

  function readMail(){
    $mails = Cobranza::getEmails();
    $flag = Cobranza::savePedidos($mails);
    echo $flag ? "OK" : "error";
    //     echo "<pre>";
    //     print_r($mails);
    //     echo "</pre>";
  }

//   function insert(){
//     print_r(Cobranza::insert());
//   }
}