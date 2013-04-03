{* Regional group - Full view *}
{set scope=global persistent_variable=hash('left_menu', true(),
                                           'extra_menu', true())}

{def $blog_posts = fetch( 'content', 'tree', hash( 'parent_node_id', $node.node_id,
                                                   'sort_by', $node.sort_array,
                                                   'limit', '5',
                                                   'class_filter_type', 'include',
                                                   'class_filter_array', array( 'blog_post' ) ) )
     $blog_posts_count = $blog_posts|count()}

{def $events = fetch( 'content', 'tree', hash( 'parent_node_id', $node.node_id,
                                               'sort_by', $node.sort_array,
                                               'limit', '5',
                                               'class_filter_type', 'include',
                                               'class_filter_array', array( 'event' ) ) )
     $events_count = $events|count()}

{def $projects = fetch( 'content', 'tree', hash( 'parent_node_id', $node.node_id,
                                                 'sort_by', $node.sort_array,
                                                 'class_filter_type', 'include',
                                                 'class_filter_array', array( 'project' ) ) )
     $projects_count = $projects|count()}

{def $donors = fetch( 'content', 'tree', hash( 'parent_node_id', $node.node_id,
                                               'sort_by', $node.sort_array,
                                               'class_filter_type', 'include',
                                               'class_filter_array', array( 'donor' ) ) )
     $donors_count = $donors|count()}

{def $size = 10}

<section class="content-view-full">
    <div class="class-regional_group row">
        <div class="span10">
        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
        </div>
    </div>
    <div class="class-regional_group row">
        {if $node.data_map.image.has_content}
        <div class="span3">
            <div class="attribute-image">
                {attribute_view_gui attribute=$node.data_map.image image_class=regional_group}
            </div>
        </div>
            {set $size = $size|sub(3)}
        {/if}
        <div class="span{$size}">
            <div class="attribute-description">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        </div>
    </div>

    {if or( $blog_posts_count, $events_count )}
    <div class="class-regional_group row">
        {if $blog_posts_count}
        {if $events_count}
        <div class="span7">
        {else}
        <div class="span10">
        {/if}
            <div class="attribute-header">
                <h2>Blog</h2>
            </div>
            <div class="attribute-blog">
                {foreach $blog_posts as $blog_post}
                    <div class="attribute-header">
                        <h3><a href={$blog_post.url_alias|ezurl} title="{$blog_post.data_map.title.content|wash}">{$blog_post.data_map.title.content|wash}</a></h3>
                     </div>

                    <div class="attribute-byline with-comments">
                        <span class="date">{$blog_post.data_map.publication_date.content.timestamp|l10n(shortdatetime)}</span>
                        <span class="author">{$blog_post.object.owner.name}</span>
<!--
                        <span class="tags"> {"Tags:"|i18n("design/eziog/line/blog_post")} 
                            {foreach $blog_post.data_map.tags.content.keywords as $keyword}
                                <a href={concat( $blog_post.parent.url_alias, "/(tag)/", $keyword|rawurlencode )|ezurl} title="{$keyword}">{$keyword}</a>
                                {delimiter}, {/delimiter}
                            {/foreach}
                        </span>
-->
                    </div>
                {/foreach}
            </div>
        </div>
        {/if}
        {if $events_count}
        {if $blog_posts_count}
        <div class="span3">
        {else}
        <div class="span10">
        {/if}
            <div class="attribute-header">
                <h2>Termine</h2>
            </div>
            <div class="attribute-event">
                {foreach $events as $event}
                    <h3>
                        <a href={$event.url_alias|ezurl}>{$event.name|wash()}</a>
                    </h3>
                    <div class="attribute-byline">
                    <p>

                    <span class="ezagenda_date">
                    {$event.object.data_map.from_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
                    {if $event.object.data_map.to_time.has_content}
                          - {$event.object.data_map.to_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
                    {/if}
                    </span>
                    </p>
                    </div>

                {/foreach}
            </div>
        </div>
        {/if}
    </div>
    {/if}

    {if $projects_count}
    <div class="class-regional_group row">
        <div class="span10">
        <div class="attribute-header">
            <h2>Projekte</h2>
        </div>
        <div class="tabbable tabs-left">
            <ul id="{$node.node_id}projects" class="nav nav-tabs">
            {foreach $projects as $project}
                {if $projects[0].node_id|eq( $project.node_id ) }
                    <li class="active"><a href="#tab{$project.node_id}" data-toggle="tab">{$project.data_map.short_name.content|wash()}</a></li>
                {else}
                    <li><a href="#tab{$project.node_id}" data-toggle="tab">{$project.data_map.short_name.content|wash()}</a></li>
                {/if}
            {/foreach}
            </ul>
            <div class="tab-content">
            {foreach $projects as $project}
                {if $projects[0].node_id|eq( $project.node_id ) }
                <div class="tab-pane active" id="tab{$project.node_id}">
                    <a href="{$project.url_alias|ezurl(no)}">
                        <div class="attribute-image">
                            {attribute_view_gui attribute=$project.data_map.image image_class='project_tab'}
                        </div>
                        <div class="overlay">
                        {if $project.data_map.coordinator.content.is_empty|not()}
                            <div class="attribute-author">
                                {attribute_view_gui attribute=$project.data_map.coordinator}
                            </div>
                        {/if}
                            <div class="attribute-header">
                                <h2>{$project.name|wash()}</h2>
                            </div>
                        </div>
                    </a>
                </div>
                {else}
                <div class="tab-pane" id="tab{$project.node_id}">
                    <a href="{$project.url_alias|ezurl(no)}">
                        <div class="attribute-image">
                            {attribute_view_gui attribute=$project.data_map.image image_class='project_tab'}
                        </div>
                        <div class="overlay">
                        {if $project.data_map.coordinator.content.is_empty|not()}
                            <div class="attribute-author">
                                {attribute_view_gui attribute=$project.data_map.coordinator}
                            </div>
                        {/if}
                            <div class="attribute-header">
                                <h2>{$project.name|wash()}</h2>
                            </div>
                        </div>
                    </a>
                </div>
                {/if}
            {/foreach}
            </div>
        </div>

        {ezscript_require(array( 'ezjsc::jquery' ) )}
        {ezscript_require( 'bootstrap-tab.js' )}
        <script type="text/javascript">
            $(document).ready(function () {ldelim}
                $('#{$node.node_id}projects').tab('show');
            {rdelim});
        </script>

        </div>
    </div>
    {/if}

    {if $donors_count}
        <div class="class-project row">
            <div class="span10">
            <div class="attribute-header">
                <h2>Unterst&uuml;tzer</h2>
            </div>
            {foreach $donors as $donor}
                <a href={$donor.url_alias|ezurl} title="{$donor.data_map.name.content|wash}">
                {attribute_view_gui attribute=$donor.data_map.image image_class=gallerythumbnail}
                </a>
            {/foreach}
            </div>
        </div>
    {/if}

</section>
