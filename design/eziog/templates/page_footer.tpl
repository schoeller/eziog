<!-- Footer area: START -->
{def $footer_node = fetch( 'content', 'tree', hash( 'parent_node_id', 1,
                                                             'limit', 1,
                                                             'class_filter_type', include,
                                                             'class_filter_array', array( 'footer' ) ) )}
<footer>
    <div class="claim-wrapper">
        <div class="container">
            <div class="nav-collapse">
                Powered by <a href="http://ez.no/ezpublish" title="eZ Publish&#8482; CMS Open Source Web Content Management">eZ Publish&#8482; CMS Open Source Web Content Management</a>.
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="span4">
                {include uri='design:footer/address.tpl' node=$footer_node[0]}
            </div>
            <div class="span4 nav-collapse">
                {include uri='design:footer/latest_news.tpl'}
            </div>
            <div class="span4 nav-collapse">
                {include uri='design:footer/links.tpl' node=$footer_node[0]}
            </div>
            <div class="span4 nav-collapse">
                {include uri='design:footer/impressum.tpl' node=$footer_node[0]}
            </div>
        </div>
    </div>
</footer>
<!-- Footer area: END -->
{undef $footer_node}
