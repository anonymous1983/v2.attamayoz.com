{if $MENU != ''}
	</div>
    <div class="logomenus mT130" id="logomenus">
        <div id="header-section-b" class="header-section-b clearfix logo-menus">
            <div class="container_9 clearfix">
            <div id="header-section-logo" class="header-section-logo grid_3 alpha">
                <a id="header_logo" class="header_logo" href="{$base_dir}" title="{$shop_name|escape:'htmlall':'UTF-8'}">
                    <img class="logo" src="{$logo_url}" alt="{$shop_name|escape:'htmlall':'UTF-8'}" {if $logo_image_width}width="{$logo_image_width}"{/if} {if $logo_image_height}height="{$logo_image_height}" {/if}  />
                </a>
            </div>
            <!-- Menu -->
            <div id="header-section-menu-search" class="header-section-menu-search grid_6 omega">
                <div class="absolute menus">
                    <div class="relative left" id="menu1">
                        <ul class="list_verticale_left menu1">
                            <li><a href="#" class=""><span>Catégories</span></a></li>
                            <li><a href="#" class=""><span>Marques</span></a></li>
                            <li><a href="#" class="current"><span>Soldes</span></a></li>                           
                            <li class="end"><a href="#"><span>Nouveautés</span></a></li>
                            
                        </ul>
                    </div>
                    <div class="relative left" id="menu2">
                        <ul class="list_verticale_left sf-menu menu2 clearfix">
                            {$MENU}
                            {if $MENU_SEARCH}
                                <li class="sf-search noBack" style="float:right">
                                    <form id="searchbox" action="{$link->getPageLink('search')}" method="get">
                                        <input type="hidden" name="controller" value="search" />
                                        <input type="hidden" value="position" name="orderby"/>
                                        <input type="hidden" value="desc" name="orderway"/>
                                        <input type="text" name="search_query" value="{if isset($smarty.get.search_query)}{$smarty.get.search_query|escape:'htmlall':'UTF-8'}{/if}" />
                                    </form>
                                </li>
                            {/if}
                        </ul>
                    </div>
                </div>
            </div>
            <!--/ Menu -->
            </div>
        </div>
{/if}
   
   
     