{if $attribute.has_content}

<div id="ezlf-map-{$attribute.id}" style="width: 468; height: 280px;"></div>

<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.4.5/leaflet.css" />
<!--[if lte IE 8]>
    <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.4.5/leaflet.ie.css" />
<![endif]-->

{ezscript_require( 'leaflet.js' )}
<script type="text/javascript">
    var map = L.map('ezlf-map-{$attribute.id}').setView(new L.LatLng({$attribute.content.latitude}, {$attribute.content.longitude}), 11);

    L.tileLayer('http://{ldelim}s{rdelim}.tile.osm.org/{ldelim}z{rdelim}/{ldelim}x{rdelim}/{ldelim}y{rdelim}.png', {ldelim}
        attribution: 'Map data &copy; 2013 OpenStreetMap',
        key: 'BC9A493B41014CAABB98F0471D759707'
    {rdelim}).addTo(map);

        L.circle(new L.LatLng({$attribute.content.latitude}, {$attribute.content.longitude}), 300, {ldelim}
            color: '#2D3B58',
            fillColor: '#00A9E0',
            fillOpacity: 0.5
        {rdelim}).addTo(map);
</script>

{/if}
