<?php
//require (dirname(__FILE__).'/menutoplinks.class.php');
class menuhorizontal extends Module
{  
  private $_menu = '';
  public function __construct()
  {
    $this->name = 'menuhorizontal';
    $this->tab = 'front_office_features';
    $this->version = '1.1';

    parent::__construct();

    $this->displayName = $this->l('horizontal menu');
    $this->description = $this->l('Medule Menu Horizontal');    
  }

  public function install()
  {
    if(!parent::install()
      || !$this->registerHook('displayTop')      
      || !$this->installModuleTab('AdminMenuhorizontal', array(1=>'My Tutorial Tab', 2=>'Mon onglet tutoriel'), 2))
      return false;
    return true;
  }

  private function installModuleTab($tabClass, $tabName, $idTabParent)
  {
    @copy(_PS_MODULE_DIR_.$this->name.'/logo1.gif', _PS_IMG_DIR_.'t/'.$tabClass.'.gif');
    $tab = new Tab();
    $tab->name = $tabName;
    $tab->class_name = $tabClass;
    $tab->module = $this->name;
    $tab->id_parent = $idTabParent;
    if(!$tab->save())
      return false;
    return true;
  }

  public function uninstall()
  {
    if(!parent::uninstall()     
      || !$this->uninstallModuleTab('AdminMenuhorizontal'))
      return false;
    return true;
  }

  private function uninstallModuleTab($tabClass)
  {
    $idTab = Tab::getIdFromClassName($tabClass);
    if($idTab != 0)
    {
      $tab = new Tab($idTab);
      $tab->delete();
      return true;
    }
    return false;
  }

 private function getCategory($id_category, $id_lang = false, $id_shop = false, $i= 1, $j= 1)
	{
		$id_lang = $id_lang ? (int)$id_lang : (int)Context::getContext()->language->id;
		$category = new Category((int)$id_category, (int)$id_lang);

		if ($category->level_depth > 1)
			$category_link = $category->getLink();
		else
			$category_link = $this->context->link->getPageLink('index');

		if (is_null($category->id))
			return;

		$children = Category::getChildren((int)$id_category, (int)$id_lang, true, (int)$id_shop);
		$selected = ($this->page_name == 'category' && ((int)Tools::getValue('id_category') == $id_category)) ? ' class="sfHoverForce"' : '';

		$is_intersected = array_intersect($category->getGroups(), $this->user_groups);
		// filter the categories that the user is allowed to see and browse
		/*if (!empty($is_intersected))
		{*/
		  if($id_category != 2){	
		  	 if($i == 1){
				$this->_menu .= '<li class="child01" >';
				$this->_menu .= '<a class="a_child01" href="'.$category_link.'"><span>'.$category->name.'</span></a>';						             }
			 if($i == 2){
				 $children_parent = Category::getChildren((int)$category->id_parent, (int)$id_lang, true, (int)$id_shop);
					if($j==1){
					 $number = 'first';	 
					 }else{
					  $number = '';	 
					 }
					 if($j == count($children_parent)){
					 $number = 'end';	 
					 }				 
				$this->_menu .= '<li class="child02 '.$number.'" >';
				$this->_menu .= '<a class="a_child02  myriad_pro" href="'.$category_link.'"><span>'.$category->name.'</span></a>';	
			}
			if($i == 3){
			   $children_parent3 = Category::getChildren((int)$category->id_parent, (int)$id_lang, true, (int)$id_shop);
			   if($j==1){
				$this->_menu .= '<li class="child03" >';
				$this->_menu .= '<div id="layer-homme-mode3" class="layer-mode layer-actif">
								 <div class="layer-actif-filet-blanc"></div>
								 <div class="layer-actif-opes">
                                    <a class="layer-actif-ope1" href="#">
                               			<img alt="" src="'.$this->_path.'media/pub_menu/foc-hom-mod-nouvelle-collection-pe1.jpg"/>
									</a>
									<a class="layer-actif-ope2" href="#">
										<img alt="" src="'.$this->_path.'media/pub_menu/foc-hom-mod-levis.jpg"/>
									</a>
								</div>';
				$this->_menu .= '<div class="layer-actif-colonnes">
								 <div class="layer-actif-colonnes_liensp left">
								 <div class="layer-actif-colonnes-a">
								  <span class="layer-actif-titre">La collection</span>
								 <div class="layer-actif-colonne">';
				  foreach ($children_parent3 as $child3){
					$id_lang3 = $id_lang ? (int)$id_lang : (int)Context::getContext()->language->id;
					$category3 = new Category((int)$child3['id_category'], (int)$id_lang3);
					$this->_menu .= '<a href="'.$category3->getLink().'">'.$category3->name.'</a>';	
				  }
				$this->_menu .= '</div>
										</div>
										<div class="layer-actif-colonnes-b">
											<span class="layer-actif-titre">Les marques à la une !</span>
											<div class="layer-actif-colonne">
												<a href="#/guess/vetement-guess-homme.html">Guess</a>
												<a href="#/desigual/vetement-desigual-homme.html">Desigual</a>
												<a href="#/cipo-baxx/tous-les-articles.html">Cipo and Baxx</a>
												<a href="#/wrangler/vetement-wrangler-homme.html">Wrangler</a>
												<a href="#/calvin-klein/vetement-homme-calvin-klein.html">Calvin Klein</a>
												<a href="#/g-star/vetement-homme.html">G-STAR</a>
												<a href="#/chevignon/vetement-homme-chevignon.html">Chevignon</a>
												<a href="#/tous-les-articles.html">Levi\'s</a>
												<a href="#/redskins/vetement-redskins-homme.html">Redskins</a>
												<a href="#/kaporal/vetement-kaporal-homme.html">Kaporal</a>
												<a href="#/polo-jeans-ralph-lauren/vetement-polo-jeans-ralph-lauren-homme.html">Polo Jeans</a>
												<a href="#/jack-jones/vetement-jack-jones-homme.html">Jack and Jones</a>
												<a href="#/rip-curl/vetement-rip-curl-homme.html">Rip curl</a>
												<a href="#/mac-douglas/tous-les-articles-mac-douglas.html">Mac Douglas</a>
												<a href="#/columbia/tous-les-articles-columbia.html">Columbia</a>
												<a href="#/napapijri/tous-les-articles.html">Napapijri</a>
											</div>
										</div>
										<div class="layer-actif-colonnes-c">
											<div class="layer-actif-colonnes-dh">
											<div class="layer-actif-colonne">
												<a class="top" href="#/catalogue_fra/homme/bonnes-affaires/toutes-les-bonnes-affaires.html">Soldes & Promos</a>
												<a href="#/pageStatiqueSbg/marques-homme-mode">Marques</a>
												<a href="#/catalogue_fra/homme/nouveaute-new-nouveau/toutes-les-nouveautes.html">Nouveautés</a>
											</div>
										</div>
											<div class="layer-actif-colonnes-db">
												<span class="layer-actif-titre">Boutiques</span>
												<div class="layer-actif-colonne">
													<a href="#/catalogue_fra/homme/nouvelle-collection-printemps-ete-2011/toute-la-collection.html">Collection Printemps-Eté</a>
													<a href="#/catalogue_fra/homme/les-tendances-de-la-saison/tous-les-articles-tendance-de-la-saison.html">Tendances Automne-Hiver</a>
													<a href="#/catalogue_fra/homme/jeans/coupes/tous-les-jeans.html">Boutique Jeans</a>
													<a href="#/catalogue_fra/homme/boutique-clubber/tous-les-articles-clubber.html">Espace clubber</a>
													<a href="#">Espace jeunes créateurs</a>
													<a href="#">Achat-vente neuf & occasion</a>
													<a href="#/catalogue_fra/homme/evenements/la-collection-en-video/tous-les-articles.html">La collection en vidéo</a>
												</div>
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>';
			   }						
			}
		  }

			if (count($children))
			{
				 if($id_category != 2){
					 if($i == 1){						 
						  $this->_menu .= '<ul class="ul_w960h360" style="background-image:url('.$this->_path.'media/bg-homme-01-02-2011.png)"> ';	
					 }else{
						  $this->_menu .= '<ul class="ul_w648" style="text-decoration:none">';
					 }
					 $i++;
				 }
				
				foreach ($children as $child)
					$this->getCategory((int)$child['id_category'], (int)$id_lang, (int)$child['id_shop'], $i, $j++);
				if($id_category != 2){
					$this->_menu .= '</ul>';
				}
			}
			if($id_category != 2){				
				 $this->_menu .= '</li>';					
			}
		//}
	}
 
  public function hookdisplayTop($params)
  {
	global $smarty;    
	/************categorie**********/
	$this->_menu .= '<ul class="list_verticale_left menu2">';
		$this->getCategory(2);
	$this->_menu .= '</ul>';
	/*$results = Db::getInstance()->ExecuteS('
	SELECT *
	FROM `'._DB_PREFIX_.'category`
	WHERE `active` = 1 and id_parent = 2 ORDER BY position');	
	foreach ( $results as $f ){		
		$this->getCategory((int)$f['id_category']);	
	}*/
	/************categorie**********/
	$smarty->assign('MENU', $this->_menu);
	$smarty->assign('this_path', $this->_path);
	$this->context->controller->addCSS($this->_path.'css/template.css');
	$html = $this->display(__FILE__, 'menuhorizontal.tpl', $smarty_cache_id);
    return $html;
  }
}
?>