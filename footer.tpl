
                </div><!-- /.main-content -->
                {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                    <div class="col-md-3 pull-md-left sidebar sidebar-secondary">
                        {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                    </div>
                {/if}
            <div class="clearfix"></div>
        </div>
    </div>
</section>

<section id="footer">
    <div class="container">
        <a href="#" class="back-to-top"><i class="fas fa-chevron-up"></i></a>
<!--START MOHD--> 
<!--REMOVE THIS
        <p>{lang key="copyrightFooterNotice" year=$date_year company=$companyname}</p>
TO HERE--> 
        <p> <a href="https://myownhelpdesk.com/terms-privacy/terms-of-use/" target="_blank" >Terms of Use</a> | <a href="https://myownhelpdesk.com/terms-privacy/privacy-policy/" target="_blank" >Privacy Policy</a> </p>
        <p>Copyright &copy; 2018-{$date_year} {$companyname}. All Rights Reserved.</p>
   <p>Hosted by: Think Solutions UK Ltd, Registered in England &amp; Wales, Reg No: 06657413 VAT No: GB944320831, t/a <a href="https://myownhelpdesk.com" target="_blank" >MyOwnHelpdesk.com</a></p>
<p>Registered Address: Think Solutions UK Ltd, Mocatta House, Trafalgar Place, Brighton, BN1 4DU, UK </p>
<!--END MOHD-->
    </div>
</section>

<div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel-primary">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">{$LANG.close}</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body panel-body">
                {$LANG.loading}
            </div>
            <div class="modal-footer panel-footer">
                <div class="pull-left loader">
                    <i class="fas fa-circle-notch fa-spin"></i>
                    {$LANG.loading}
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    {$LANG.close}
                </button>
                <button type="button" class="btn btn-primary modal-submit">
                    {$LANG.submit}
                </button>
            </div>
        </div>
    </div>
</div>

{include file="$template/includes/generate-password.tpl"}

{$footeroutput}

</body>
</html>
