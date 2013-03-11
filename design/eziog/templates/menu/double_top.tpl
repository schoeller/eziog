<!-- Top menu content: START -->
<div class="navbar-inner">
    <div class="container">

        <a class="btn btn-navbar" data-action="toggleclass" data-class="nav-collapse" data-target=".main-navi .nav-collapse">{'Navigation'|i18n( 'design/ezdemo/menu' )}</a>

        <div class="nav-collapse">
            <ul class="nav" role="navigation">
                {def $root_node = fetch( 'content', 'node', hash( 'node_id', $pagedata.root_node ) )
                     $top_menu_class_filter = ezini( 'MenuContentSettings', 'TopIdentifierList', 'menu.ini' )
                     $top_menu_items = fetch( 'content', 'list', hash( 'parent_node_id', $root_node.node_id,
                                                                       'sort_by', $root_node.sort_array,
                                                                       'class_filter_type', 'include',
                                                                       'class_filter_array', $top_menu_class_filter ) )
                     $top_menu_items_count = $top_menu_items|count()
                     $item_class = array()
                     $level_2_items = 0
                     $current_node_in_path = first_set($pagedata.path_array[1].node_id, 0  )
                     $current_node_in_path_2 = first_set($pagedata.path_array[2].node_id, 0  )}

                {if $top_menu_items_count}
                   {foreach $top_menu_items as $key => $item}
                        {set $item_class = array()}
                        {if $current_node_in_path|eq($item.node_id)}
                            {set $item_class = array("active")}
                        {/if}

                        {set $level_2_items = fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
                                                                              'sort_by', $item.sort_array,
                                                                              'class_filter_type', 'include',
                                                                              'class_filter_array', $top_menu_class_filter ) )}

                        {if $key|eq(0)}
                            {set $item_class = $item_class|append("firstli")}
                        {/if}
                        {if $top_menu_items_count|eq( $key|inc )}
                            {set $item_class = $item_class|append("lastli")}
                        {/if}
                        {if $item.node_id|eq( $current_node_id )}
                            {set $item_class = $item_class|append("current")}
                        {/if}

                        <li class="dropdown">
                        {if $level_2_items|count()}
                            <a id="{$item.node_id}" href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if $pagedata.is_edit} onclick="return false;"{/if} role="button" class="{$item_class|implode(" ")}">{$item.name|wash()}</a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="{$item.node_id}">
                            {foreach $level_2_items as $key => $item}
                                <li><a tabindex="-1" href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if $pagedata.is_edit} onclick="return false;"{/if}>{$item.name|wash()}</a></li>
                            {/foreach}
                            </ul>
                        {else}
                            <a class="{$item_class|implode(" ")}" href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if $pagedata.is_edit} onclick="return false;"{/if}>{$item.name|wash()}</a>
                        {/if}
                        </li>

                    {/foreach}
                {/if}
            </ul>
        </div>

    </div>
</div>

{ezscript_require(array( 'ezjsc::jquery' ) )}
{ezscript_require( 'bootstrap-dropdown.js' )}

<script type="text/javascript">
{literal}
    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();
    });
{/literal}
</script>

{undef $level_2_items $root_node $top_menu_items $item_class $top_menu_items_count $current_node_in_path $current_node_in_path_2}
<!-- Top menu content: END -->
