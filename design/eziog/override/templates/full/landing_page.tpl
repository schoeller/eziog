{if $node.depth|eq(1)}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', true())}
{def $size=13}
{else}
{set scope=global persistent_variable=hash('left_menu', true(),
                                           'extra_menu', true())}
{def $size=10}
{/if}

<div class="content-view-full">
    <div class="class-landing-page">

    <div class="attribute-page">
    {attribute_view_gui attribute=$node.object.data_map.page size=$size}
    </div>

    </div>
</div>

{undef $size}
