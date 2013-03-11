{def $banner_source_nodeid = ezini( 'NodeSettings', 'MediaRootNode', 'content.ini' )}

{def $banners = fetch( 'content', 'tree', hash( 'parent_node_id', $banner_source_nodeid,
                                                'class_filter_type', include,
                                                'class_filter_array', array( 'banner' ) ) )}

{if $banners}
    {def $banner = $banners[ rand( 0, $banners|count()|sub(1) ) ]}
    <div class="banner" style=background-image:url({$banner.data_map.image.content[banner].url|ezroot('double', 'full')})>
    </div>
{else}
    Keine Banner definiert
{/if}
{undef}

