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

		{if !$content_only}
        			</div><!-- End Center Content-->
				</div><!-- End Center-->
				{if ( isset($page_name) && $page_name != 'index' ) || (!isset($page_name) ) }
				<!-- Right -->
				<div id="right_column" class="right_column column grid_2 omega">
    	            <div class="right_column-content">
						{$HOOK_RIGHT_COLUMN}
                    </div>
				</div>
                {/if}
			</div>
		</div>
	{/if}
		<!-- Footer -->    
        <div id="footer" class="footer">
            <div class="container_9 clearfix">
                <div class="grid_9 omega alpha clearfix">
                    {$HOOK_FOOTER}
                    {if $PS_ALLOW_MOBILE_DEVICE}
                        <!-- <p class="center clearBoth"><a href="{$link->getPageLink('index', true)}?mobile_theme_ok">{l s='Browse the mobile site'}</a></p> -->
                        <p class="center clearBoth">Copyright &copy; 2012 NomDuSite  -  design by <a href="http://karar-consulting.com/">Karar Consulting</a>  -  developped by <a href="http://karar-consulting.com/">Karar Consulting</a></p> 
                    {/if}
                </div>
            </div>
		</div>
	</body>
</html>
