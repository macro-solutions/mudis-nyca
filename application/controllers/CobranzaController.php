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
    $mail = Cobranza::getEmails();
    echo "<pre>";
    print_r($mail);
    echo "</pre>";
  }
}
