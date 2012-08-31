<?php
$librayPath = ROOT . DS . 'library' . DS;
$controllerPath = ROOT . DS . 'application' . DS . 'controllers' . DS;
$modelsPath = ROOT . DS . 'application' . DS . 'models' . DS;
require_once (ROOT . DS . 'library' . DS . 'simple_html_dom.php');
require_once ($librayPath. 'controller.class.php');
require_once ($librayPath. 'mysql.class.php');
require_once ($librayPath. 'session.class.php');
require_once ($librayPath. 'template.class.php');
require_once ($librayPath. 'html.class.php');
require_once ($librayPath. 'email.class.php');

//controllers
require_once ($controllerPath. 'CobranzaController.php');
require_once ($controllerPath. 'LoginController.php');

//models
require_once ($modelsPath. 'Cobranza.php');
require_once ($modelsPath. 'Login.php');

set_include_path(implode(PATH_SEPARATOR, array(
__DIR__,
get_include_path(),
)));

require_once ('Zend/Loader/Autoloader.php');
require_once (ROOT . DS . 'config' . DS . 'config.php');
require_once (ROOT . DS . 'library' . DS . 'shared.php');