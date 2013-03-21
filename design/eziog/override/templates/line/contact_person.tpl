{* Contact person - Line view *}

<div class="content-view-line">
    <article class="class-contact_person row">

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
                <a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash()}</a>
            </h2>
            <div class="pull-right">
            </div>
        </div>

        <div class="attribute-byline">
            <span class="user">
                {$node.data_map.first_name.content|wash()}&nbsp;{$node.data_map.last_name.content|wash()}
            </span>
            <span class="area_of_work">
                {attribute_view_gui attribute=$node.data_map.description}
            </span>
        </div>
    </div>

    </article>

</div>

