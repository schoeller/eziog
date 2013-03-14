<!-- Footer area: START -->
{def $footer_node = fetch( 'content', 'tree', hash( 'parent_node_id', 1,
                                                             'limit', 1,
                                                             'class_filter_type', include,
                                                             'class_filter_array', array( 'global_footer_layout' ) ) )}
<footer>
    <div class="claim-wrapper">
        <div class="container">
            <div class="nav-collapse">
               {attribute_view_gui attribute=$footer_node[0].data_map.slogan} 
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="span4">
                {attribute_view_gui attribute=$footer_node[0].data_map.column_1}
            </div>
            <div class="span4 nav-collapse">
                {attribute_view_gui attribute=$footer_node[0].data_map.column_2}
            </div>
            <div class="span4 nav-collapse">
                {attribute_view_gui attribute=$footer_node[0].data_map.column_3}
            </div>
            <div class="span4 nav-collapse">
                {attribute_view_gui attribute=$footer_node[0].data_map.column_4}
            </div>
        </div>
    </div>
</footer>
<!-- Footer area: END -->
{undef $footer_node}
