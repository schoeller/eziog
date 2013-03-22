{if and( is_set( $block.custom_attributes.limit ), 
            ne( $block.custom_attributes.limit, '' ) )}
    {def $limit = $block.custom_attributes.limit}
{else}
    {def $limit = '5'}

{/if}
{if and( is_set( $block.custom_attributes.height ), 
            ne( $block.custom_attributes.height, '' ) )}
    {def $height = $block.custom_attributes.height}
{else}
    {def $height = '600'}
{/if}

{def $locations = fetch( 'content', 'tree', hash( 'parent_node_id', $block.custom_attributes.parent_node_id,
                                                  'class_filter_type', 'include',
                                                  'class_filter_array', array( $block.custom_attributes.class ),
                                                  'sort_by', array( 'published', false() ),
                                                  'limit', $limit ) )
     $attribute = $block.custom_attributes.attribute}

<h2>{$block.name|wash()}</h2>
<div id="ezflb-map-{$block.id}" style="height:{$height}px"></div>

<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.5/leaflet.css" />
<!--[if lte IE 8]>
    <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.5/leaflet.ie.css" />
<![endif]-->

{ezscript_require( 'leaflet.js' )}
<script type="text/javascript">
<!--

    var map = L.map('ezflb-map-{$block.id}').setView(new L.LatLng(51.5, -0.09), 1);

    L.tileLayer('http://{ldelim}s{rdelim}.tile.osm.org/{ldelim}z{rdelim}/{ldelim}x{rdelim}/{ldelim}y{rdelim}.png', {ldelim}
        attribution: 'Map data &copy; 2012 OpenStreetMap, Imagery &copy; 2012 CloudMade',
        key: 'e1cae205addf4a8abecf7943a8a7b49d'
    {rdelim}).addTo(map);
    
    {foreach $locations as $location}
        L.circle(new L.LatLng({$location.data_map[$attribute].content.latitude}, {$location.data_map[$attribute].content.longitude}), 300, {ldelim}
            color: '#2D3B58',
            fillColor: '#00A9E0',
            fillOpacity: 0.5
        {rdelim}).addTo(map).bindPopup("<a href={$location.url_alias|ezurl|wash( javascript )}>{$location.name|wash}</a>");
    {/foreach}

    map.fitWorld();

-->
</script>
{undef $limit $height $locations $attribute}

<p></p>
