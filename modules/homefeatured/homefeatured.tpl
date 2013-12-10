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

<!-- MODULE Home Featured Products -->
<div id="featured-products_block_center" class="block products_block module_home_featured_products featured-products_block_center clearfix">
	<div class="module_content">
        <h4>{l s='Featured products' mod='homefeatured'}</h4>
        {if isset($products) AND $products}
            <div class="block_content">
                {assign var='liHeight' value=250}
                {assign var='nbItemsPerLine' value=4}
                {assign var='nbLi' value=$products|@count}
                {math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}
                {math equation="nbLines*liHeight" nbLines=$nbLines|ceil liHeight=$liHeight assign=ulHeight}
                <ul style="" class="produits-grid clearfix">
                {foreach from=$products item=product name=homeFeaturedProducts}
                    <li class="ajax_block_product item-product {if $smarty.foreach.homeFeaturedProducts.first}first_item{elseif $smarty.foreach.homeFeaturedProducts.last}last_item{else}item{/if} {if $smarty.foreach.homeFeaturedProducts.iteration%$nbItemsPerLine == 0}last_item_of_line{elseif $smarty.foreach.homeFeaturedProducts.iteration%$nbItemsPerLine == 1} {/if} {if $smarty.foreach.homeFeaturedProducts.iteration > ($smarty.foreach.homeFeaturedProducts.total - ($smarty.foreach.homeFeaturedProducts.total % $nbItemsPerLine))}last_line{/if}">
                    	<div class="iprod-content">
                        	<div class="iprodc-img">
	                            <a href="{$product.link}" title="{$product.name|escape:html:'UTF-8'}" class="product_image"><img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home')}" height="{$homeSize.height}" width="{$homeSize.width}" alt="{$product.name|escape:html:'UTF-8'}" /> {if isset($product.new) && $product.new == 1}<div class="new">{l s='New' mod='homefeatured'}</div>{/if}</a>
                            </div>
                            <h5 class="iprodc-title"><a href="{$product.link}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h5>
                            <div class="iprodc-desc product_desc">{$product.description_short|strip_tags|truncate:65:'...'}</div>
                            {if $product.show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
                                <div class="price_container">
                                    <a class="" href="{$product.link}" title="{l s='View' mod='homefeatured'}">
                                        <span class="from">{l s='from'}</span>
                                        <span class="price"> {if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</span>
                                    </a>
                                </div>
                            {/if}
                           
                        </div>
                    </li>
                {/foreach}
                </ul>
            </div>
        {else}
            <p>{l s='No featured products' mod='homefeatured'}</p>
        {/if}
	</div>
</div>
<!-- /MODULE Home Featured Products -->
