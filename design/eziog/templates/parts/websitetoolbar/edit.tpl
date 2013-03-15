{def $current_user=fetch( 'user', 'current_user' )}
{def $current_node = fetch( 'content', 'node', hash( 'node_id', $node.node_id ) )
     $content_object = $current_node.object
     $can_edit_languages = $content_object.can_edit_languages
     $can_manage_location = fetch( 'content', 'access', hash( 'access', 'manage_locations', 'contentobject', $current_node ) )
     $can_create_languages = $content_object.can_create_languages
     $is_container = $content_object.content_class.is_container
     $website_toolbar_access = fetch( 'user', 'has_access_to', hash( 'module', 'websitetoolbar', 'function', 'use' ) )
     $content_object_language_code = ''
     $policies = fetch( 'user', 'user_role', hash( 'user_id', $current_user.contentobject_id ) )
     $available_for_current_class = false()
     $custom_templates = ezini( 'CustomTemplateSettings', 'CustomTemplateList', 'websitetoolbar.ini' )
     $include_in_view = ezini( 'CustomTemplateSettings', 'IncludeInView', 'websitetoolbar.ini' )
     $node_hint = ': '|append( $current_node.name|wash(), ' [', $content_object.content_class.name|wash(), ']' ) }

     {foreach $policies as $policy}
        {if and( eq( $policy.moduleName, 'websitetoolbar' ),
                    eq( $policy.functionName, 'use' ),
                        is_array( $policy.limitation ) )}
            {if $policy.limitation[0].values_as_array|contains( $content_object.content_class.id )}
                {set $available_for_current_class = true()}
            {/if}
        {elseif or( and( eq( $policy.moduleName, '*' ),
                             eq( $policy.functionName, '*' ),
                                 eq( $policy.limitation, '*' ) ),
                    and( eq( $policy.moduleName, 'websitetoolbar' ),
                             eq( $policy.functionName, '*' ),
                                 eq( $policy.limitation, '*' ) ),
                    and( eq( $policy.moduleName, 'websitetoolbar' ),
                             eq( $policy.functionName, 'use' ),
                                 eq( $policy.limitation, '*' ) ) )}
            {set $available_for_current_class = true()}
        {/if}
     {/foreach}

{if and( $website_toolbar_access, $available_for_current_class )}

<!-- eZ website toolbar: START -->

<!-- eZ website toolbar content: START -->

<form method="post" action={"content/action"|ezurl}>

<div id="ezwt-currentpageaction" class="ezwt-actiongroup">

{if $content_object.can_edit}
    <input type="hidden" name="ContentObjectLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
    <input class="ezwt-input-image" type="image" src={"websitetoolbar/ezwt-icon-edit.png"|ezimage} name="EditButton" title="{'Edit'|i18n( 'design/standard/parts/website_toolbar')}{$node_hint}" />
{/if}

{if $content_object.can_move}
    <input class="ezwt-input-image" type="image" src={"websitetoolbar/ezwt-icon-move.png"|ezimage} name="MoveNodeButton" title="{'Move'|i18n('design/standard/parts/website_toolbar')}{$node_hint}" />
{/if}

{if $content_object.can_remove}
    <input class="ezwt-input-image" type="image" src={"websitetoolbar/ezwt-icon-remove.png"|ezimage} name="ActionRemove" title="{'Remove'|i18n('design/standard/parts/website_toolbar')}{$node_hint}" />
{/if}

</div>

</form>

{/if}

<!-- eZ website toolbar content: END -->

<!-- eZ website toolbar: END -->
