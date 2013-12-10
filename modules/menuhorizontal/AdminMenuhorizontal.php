<?php
include_once(PS_ADMIN_DIR.'/../classes/AdminTab.php');
class AdminTutorial extends AdminTab
{
  private $module = 'menuhorizontal';

  public function __construct()
  {
    global $cookie, $_LANGADM;
    $langFile = _PS_MODULE_DIR_.$this->module.'/'.Language::getIsoById(intval($cookie->id_lang)).'.php';
    if(file_exists($langFile))
    {
      require_once $langFile;
      foreach($_MODULE as $key=>$value)
        if(substr(strip_tags($key), 0, 5) == 'Admin')
          $_LANGADM[str_replace('_', '', strip_tags($key))] = $value;
    }
    parent::__construct();
  }

  public function display()
  {
    echo $this->l('This is my tab ! A big big thanks to Julien Breux').'<br /><p class="center"><img src="'.Configuration::get('MOD_TUTORIAL_IMG').'" alt="-" /></p>';
  }
}
?>