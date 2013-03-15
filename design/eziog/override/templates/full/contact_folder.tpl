{* Contact folder - Full view *}
{set scope=global persistent_variable=hash('left_menu', true(),
                                           'extra_menu', true())}

{def $size = 16}
{if $persistent_variable.left_menu}
    {set $size = $size|sub(3)}
{/if}
{if $persistent_variable.extra_menu}
    {set $size = $size|sub(3)}
{/if}

<section class="content-view-full">
    <div class="class-contact_folder row">
        <div class="span10">

            <div class="attribute-header">
                <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
            </div>

            {if $node.object.data_map.description.has_content}
                <div class="attribute-long">
                    {attribute_view_gui attribute=$node.data_map.description}
                </div>
            {/if}

            {if $node.object.data_map.show_children.data_int}
                {def $page_limit = 10
                     $classes = ezini( 'MenuContentSettings', 'ExtraIdentifierList', 'menu.ini' )
                     $children = array()
                     $children_count = ''}

                {if le( $node.depth, '3')}
                    {set $classes = $classes|merge( ezini( 'ChildrenNodeList', 'ExcludedClasses', 'content.ini' ) )}
                {/if}

                {set $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                          'class_filter_type', 'exclude',
                                                                          'class_filter_array', $classes ) )}

                <section class="content-view-children">
                    {if $children_count}
                    <div class="accordion" id="contact{$node.node_id}">
                        <div class="accordion-contact-group">
                        {foreach fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                                'offset', $view_parameters.offset,
                                                                'sort_by', $node.sort_array,
                                                                'class_filter_type', 'exclude',
                                                                'class_filter_array', $classes,
                                                                'limit', $page_limit ) ) as $child }
                            {node_view_gui view='line' content_node=$child node_id=$node.node_id size=$size}
                        {/foreach}
                        </div>
                    </div>
                    {/if}
                </section>

                {include name=navigator
                         uri='design:navigator/google.tpl'
                         page_uri=$node.url_alias
                         item_count=$children_count
                         view_parameters=$view_parameters
                         item_limit=$page_limit}

                {ezscript_require(array( 'ezjsc::jquery' ) )}
                {ezscript_require( 'bootstrap-transition.js' )}
                {ezscript_require( 'bootstrap-collapse.js' )}
                <script type="text/javascript">
                    $(document).ready(function () {ldelim}
                        $(".collapse").collapse({ldelim}
                            toggle: false
                        {rdelim})
                    {rdelim});
                </script>

            {/if}

        </div>
    </div>
</section>

{undef $size}
