{* Donor - Full view *}
{set scope=global persistent_variable=hash('left_menu', true(),
                                           'extra_menu', true())}

<section class="content-view-full">
    <article class="class-donor row">
        <div class="span10">
            <div class="attribute-header">
                <h1>{$node.data_map.name.content|wash()}</h1>
            </div>

            <div class="attribute-byline">
                <span class="date">
                    {$node.object.published|l10n(shortdatetime)}
                </span>
            </div>

        {if eq( ezini( 'article', 'ImageInFullView', 'content.ini' ), 'enabled' )}
            {if $node.data_map.image.has_content}
                <div class="attribute-image full-head">
                    {attribute_view_gui attribute=$node.data_map.image image_class=articleimage}
                </div>
            {/if}
        {/if}

        {if eq( ezini( 'article', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
            {if $node.data_map.summary.content.is_empty|not}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.summary}
                </div>
            {/if}
        {/if}

        {if $node.data_map.description.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}

        {def $tipafriend_access=fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'tipafriend' ) )}
        {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
            <div class="attribute-tipafriend">
                <p><a href={concat( "/content/tipafriend/", $node.node_id )|ezurl} title="{'Tip a friend'|i18n( 'design/ezdemo/full/article' )}">{'Tip a friend'|i18n( 'design/ezdemo/full/article' )}</a></p>
            </div>
        {/if}
        </div>
    </article>
</section>

