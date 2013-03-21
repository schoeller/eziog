{* Project - Line view *}

<div class="content-view-line">
    <article class="class-project row">

    {if $node.data_map.image.has_content}
    <div class="span2">
        <div class="attribute-image">
            {attribute_view_gui image_class=articlethumbnail href=$node.url_alias|ezurl attribute=$node.data_map.image}
        </div>
    </div>
        {set $size = $size|sub(2)}
    {/if}

    <div class="span{$size}">
        <div class="attribute-header">
            <h2>
                <a href="{$node.url_alias|ezurl( 'no' )}" class="teaser-link">{$node.data_map.name.content|wash()}</a>
            </h2>
        </div>

        <div class="attribute-byline with-comments">
        {if $node.data_map.coordinator.content.is_empty|not()}
            <span class="author">
                {attribute_view_gui attribute=$node.data_map.coordinator}
            </span>
        {/if}
        </div>

        {if $node.data_map.summary.content.is_empty|not}
        <div class="attribute-short">
            {attribute_view_gui attribute=$node.data_map.summary}
        </div>
        {/if}
    </div>

    </article>
</div>

