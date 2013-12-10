{*
* 2007-2012 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 6594 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- Block languages module -->
{if count($languages) > 1}
<div id="languages_block_top" class="languages_block_top clearfix">
	<div id="countries" class="countries">
	{* @todo fix display current languages, removing the first foreach loop *}
{foreach from=$languages key=k item=language name="languages"}
	{if $language.iso_code == $lang_iso}
		<div class="selected_language" style="background-image:url('{$img_lang_dir}{$language.id_lang}.jpg');">
			<img src="{$img_lang_dir}{$language.id_lang}.jpg" alt="{$language.iso_code}" width="16" height="11" />
		</div>
	{/if}
{/foreach}
		<div id="first-languages" class="first-languages countries_ul">
            <div class="section-top-sous-list">
            	<div class="section-top-sous-list">
                	<div class="section-top-sous-list-a">
                        <ul id="ul" class="ul">
                        {foreach from=$languages key=k item=language name="languages"}
                            <li {if $language.iso_code == $lang_iso}class="selected_language"{/if}>
                            {if $language.iso_code != $lang_iso}
                                {assign var=indice_lang value=$language.id_lang}
                                {if isset($lang_rewrite_urls.$indice_lang)}
                                    <a href="{$lang_rewrite_urls.$indice_lang|escape:htmlall}" title="{$language.name}">
                                {else}
                                    <a href="{$link->getLanguageLink($language.id_lang)|escape:htmlall}" title="{$language.name}">
                
                                {/if}
                            {/if}
                            	<div class="item-language clearfix">
                                	<div class="item-language-img" style="background-image:url('{$img_lang_dir}{$language.id_lang}.jpg')">
	                                    <img src="{$img_lang_dir}{$language.id_lang}.jpg" alt="{$language.iso_code}" width="16" height="11" />
                                    </div>
                                    <div class="item-language-title">
                                    	{$language.name}
                                    </div>
                                </div>
                            {if $language.iso_code != $lang_iso}
                                </a>
                            {/if}
                            </li>
                        {/foreach}
                        </ul>
                    </div>
            	</div>
            </div>
        </div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function () {
	$("#countries").mouseover(function(){
		$(this).addClass("countries_hover");
		$(".countries_ul").addClass("countries_ul_hover");
	});
	$("#countries").mouseout(function(){
		$(this).removeClass("countries_hover");
		$(".countries_ul").removeClass("countries_ul_hover");
	});

});
</script>
{/if}
<!-- /Block languages module -->
