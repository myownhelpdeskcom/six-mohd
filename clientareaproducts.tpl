{include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="4" noSortColumns="0"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableServicesList').removeClass('hidden').DataTable();
        {if $orderby == 'product'}
            table.order([1, '{$sort}'], [4, 'asc']);
        {elseif $orderby == 'amount' || $orderby == 'billingcycle'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'nextduedate'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'domainstatus'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').addClass('hidden');
    });
</script>
<div class="table-container clearfix">
    <table id="tableServicesList" class="table table-list hidden">
        <thead>
            <tr>
                <th></th>
                <th>{$LANG.orderproduct}</th>
                <th>{$LANG.clientareaaddonpricing}</th>
                <th>{$LANG.clientareahostingnextduedate}</th>
                <th>{$LANG.clientareastatus}</th>
                <th class="responsive-edit-button" style="display: none;"></th>
            </tr>
        </thead>
        <tbody>
            {foreach key=num item=service from=$services}
                <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=productdetails&amp;id={$service.id}', false)">
                    <td class="text-center{if $service.sslStatus} ssl-info{/if}" data-element-id="{$service.id}" data-type="service"{if $service.domain} data-domain="{$service.domain}"{/if}>
                        {if $service.sslStatus}
                            <img src="{$service.sslStatus->getImagePath()}" data-toggle="tooltip" title="{$service.sslStatus->getTooltipContent()}" class="{$service.sslStatus->getClass()}"/>
                        {elseif !$service.isActive}
                            <img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" data-toggle="tooltip" title="{lang key='sslState.sslInactiveService'}">
                        {/if}
                    </td>
                    <td>
<!--START Product Image-->   
<div style="float: left; padding-right:5px;">
<div class="productimage-wrapper" style="margin: 0; border: 5px solid #fff; width:85px; height:85px;"> <!--Note: Wrapper width/height should equal double the border width/height plus the image width/height.-->
{if $productimageid["product"][$productimage[$service.id].packageid]|@count < 2}
<img id="{$productimageid["product"][$productimage[$service.id].packageid][0]}" src="modules/addons/productimage/product_images/{$productimageid["product"][$productimage[$service.id].packageid][0]}.png" style="width: 75px; height: 75px;" onerror="productImageError(this);">
{else}
<div class="jcarousel-auto">
<ul>
{foreach $productimageid["product"][$productimage[$service.id].packageid] as $image}
<li><img id="{$image}" src="modules/addons/productimage/product_images/{$image}.png" style="width: 75px; height: 75px;" onerror="productImageError(this);"></li>
{/foreach}
</ul>
</div>
{/if}
</div>
</div>
<!--END Product Image-->
                    <strong>{$service.product}</strong>{if $service.domain}<br /><a href="http://{$service.domain}" target="_blank">{$service.domain}</a>{/if}</td>
                    <td class="text-center" data-order="{$service.amountnum}">{$service.amount}<br />{$service.billingcycle}</td>
                    <td class="text-center"><span class="hidden">{$service.normalisedNextDueDate}</span>{$service.nextduedate}</td>
                    <td class="text-center"><span class="label status status-{$service.status|strtolower}">{$service.statustext}</span></td>
                    <td class="responsive-edit-button" style="display: none;">
                        <a href="clientarea.php?action=productdetails&amp;id={$service.id}" class="btn btn-block btn-info">
                            {$LANG.manageproduct}
                        </a>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fas fa-spinner fa-spin"></i> {$LANG.loading}</p>
    </div>
</div>
