<?php
class CobranzaController extends Controller{
  function admin(){
    $mail = Cobranza::getEmails();
    $this->set('title','Mudis Nyca CRM - Cobranza',false);
    $this->set('mail',$mail,false);
  }
}
