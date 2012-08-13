<?php
require_once (ROOT . DS . 'library' . DS . 'simple_html_dom.php');
set_include_path(implode(PATH_SEPARATOR, array(
__DIR__,
get_include_path(),
)));
require_once ('zend/Loader/Autoloader.php');
require_once (ROOT . DS . 'config' . DS . 'config.php');
require_once (ROOT . DS . 'library' . DS . 'shared.php');