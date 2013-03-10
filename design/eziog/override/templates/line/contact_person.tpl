{* Contact person - Line view *}
{def $user=fetch(content,object, hash(object_id, $node.data_map.user.content.relation_list[0].contentobject_id))}

{include uri="design:parts/pagedata.tpl"}

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
                {$node.data_map.title.content|wash()}
            </h2>
        </div>

        <div class="attribute-byline">
            <span class="user">
                {$user.data_map.first_name.content|wash()}&nbsp;{$user.data_map.last_name.content|wash()}
            </span>
            <span class="area_of_work">
                {attribute_view_gui attribute=$node.data_map.area_of_work}
            </span>
            <span class="user">
                {attribute_view_gui attribute=$node.data_map.user}
            </span>
        </div>
    </div>

    </article>
</div>

