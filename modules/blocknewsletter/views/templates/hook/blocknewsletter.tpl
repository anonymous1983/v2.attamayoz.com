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

<!-- Block Newsletter module-->
<div class="grid_3 omega">
    <div id="newsletter_block" class=" newsletter_block {if isset($block)} {$block} {/if}">
        <div class="tiket"></div>
        <div class="module_content clearfix">
        	<div class="content clearfix">
                <!--<h4>{l s='Newsletter' mod='blocknewsletter'}</h4>-->
                <div class="title_a">{l s='Advantages & new preview!' mod='blocknewsletter'}</div>
                <h4 class="title_b">{l s='Subscribe to the newsletter' mod='blocknewsletter'}</h4>
                <div class="block_content">
                <div class="message_retour">
                    {if isset($msg) && $msg}
                        <p class="msg {if $nw_error}warning_inline{else}success_inline{/if}">{$msg}</p>
                    {/if}
                </div>
                    <form action="{$link->getPageLink('index')}" method="post">
                        <p class="form clearfix">
                            {* @todo use jquery (focusin, focusout) instead of onblur and onfocus *}
                            <input type="text" name="email" class="email" size="18" 
                                value="{if isset($value) && $value}{$value}{else}{l s='your e-mail' mod='blocknewsletter'}{/if}" 
                                onfocus="javascript:if(this.value=='{l s='your e-mail' mod='blocknewsletter'}')this.value='';" 
                                onblur="javascript:if(this.value=='')this.value='{l s='your e-mail' mod='blocknewsletter'}';" 
                                class="inputNew" />
                            <!--<select name="action">
                                <option value="0"{if isset($action) && $action == 0} selected="selected"{/if}>{l s='Subscribe' mod='blocknewsletter'}</option>
                                <option value="1"{if isset($action) && $action == 1} selected="selected"{/if}>{l s='Unsubscribe' mod='blocknewsletter'}</option>
                            </select>-->
                            <input type="submit" value="{l s='send' mod='blocknewsletter'}" class="button_mini" name="submitNewsletter" />
                            <input type="hidden" name="action" value="0" />
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /Block Newsletter module-->
