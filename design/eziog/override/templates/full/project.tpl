{* Project - Full view *}
{set scope=global persistent_variable=hash('left_menu', true(),
                                           'extra_menu', true())}

{def $blogs = fetch( 'content', 'tree', hash( 'parent_node_id', $node.node_id,
                                                   'sort_by', $node.sort_array,
                                                   'limit', '5',
                                                   'class_filter_type', 'include',
                                                   'class_filter_array', array( 'blog' ) ) )
     $blogs_count = $blogs|count()}

{def $galleries = fetch( 'content', 'tree', hash( 'parent_node_id', $node.node_id,
                                               'sort_by', $node.sort_array,
                                               'limit', '10',
                                               'class_filter_type', 'include',
                                               'class_filter_array', array( 'gallery' ) ) )
     $galleries_count = $galleries|count()}

{def $file_folders = fetch( 'content', 'tree', hash( 'parent_node_id', $node.node_id,
                                                 'sort_by', $node.sort_array,
                                                 'class_filter_type', 'include',
                                                 'class_filter_array', array( 'file_folder' ) ) )
     $file_folders_count = $file_folders|count()}

{def $donor_folders = fetch( 'content', 'tree', hash( 'parent_node_id', $node.node_id,
                                               'sort_by', $node.sort_array,
                                               'class_filter_type', 'include',
                                               'class_filter_array', array( 'donor_folder' ) ) )
     $donor_folders_count = $donor_folders|count()}

<section class="content-view-full">
    <div class="class-project row">
        <div class="span10">
        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
        </div>
    </div>
    <div class="class-project row">
        <div class="span3">
            <div class="attribute-image">
                {attribute_view_gui attribute=$node.data_map.image image_class=regional_group}
            </div>
        </div>
        <div class="span7">
            <div class="attribute-description">
                {attribute_view_gui attribute=$node.data_map.summary}
            </div>
            <a class="btn btn-primary" data-toggle="collapse" data-target="#project{$node.node_id}" data-on-hidden="Mehr erfahren" data-on-active="&Uuml;bersicht">default</a>
        </div>
    </div>

    <div id="project{$node.node_id}" class="collapse in">
        <div class="class-project row">
        <div class="span10">
            <div class="attribute-header">
                <h2>{attribute_view_gui attribute=$node.data_map.name}</h2>
            </div>
            <div class="attribute-byline">
                <span class="date">
                    {$node.object.published|l10n(shortdatetime)}
                </span>
            {if $node.data_map.coordinator.content.is_empty|not()}
                <span class="author">
                    {attribute_view_gui attribute=$node.data_map.coordinator}
                </span>
            {/if}
            </div>
            <div class="attribute-description">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        </div>
        </div>
        <div class="class-project row">
        <div class="span10">
            <aside>
                <section class="content-view-aside">
                    {if $node.data_map.location.has_content}
                    <h2>{'Location'|i18n( 'design/ezdemo/full/article' )}</h2>
                    <article>
                        <div class="attribute-location">
                            {attribute_view_gui attribute=$node.data_map.location}
                        </div>
                    </article>
                    {/if}
                </section>
                <div class="attribute-tags">
                    {attribute_view_gui attribute=$node.data_map.tags}
                </div>
            </aside>
        </div>
        </div>

            {ezscript_require(array( 'ezjsc::jquery' ) )}
            {ezscript_require( 'bootstrap-collapse.js' )}
            <script type="text/javascript">
            {literal}

                var $togglers = $('[data-toggle="collapse"]');
                $togglers.each(function() {
                    var $this = $(this);
                    var $collapsible = $($this.data('target'));
                    $collapsible.on('hidden', function() {
                        var text = $this.data('on-hidden');
                        text && $this.text(text);
                    }).on('shown', function() {
                        var text = $this.data('on-active');
                        text && $this.text(text);
                    });
                });

                $('.collapse').collapse();

            {/literal}
            </script>
    </div>


    <div class="class-project row">
        <div class="span10">
            {if $blogs_count}
            {foreach $blogs as $blog}
            {def $blog_posts = fetch( 'content', 'tree', hash( 'parent_node_id', $node.node_id,
                                                               'sort_by', $node.sort_array,
                                                               'limit', '5',
                                                               'class_filter_type', 'include',
                                                               'class_filter_array', array( 'blog_post' ) ) )}
            <div class="attribute-header">
                <h2><a href={$blog.url_alias|ezurl} title="{$blog.data_map.name.content|wash}">{$blog.data_map.name.content|wash}</a></h2>
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
                        <span class="tags"> {"Tags:"|i18n("design/ezdemo/line/blog_post")}
                            {foreach $blog_post.data_map.tags.content.keywords as $keyword}
                                <a href={concat( $blog_post.parent.url_alias, "/(tag)/", $keyword|rawurlencode )|ezurl} title="{$keyword}">{$keyword}</a>
                                {delimiter}, {/delimiter}
                            {/foreach}
                        </span>
-->
                    </div>
                    {if $blog_post|eq($blog_posts[0])}
                        <div class="attribute-body">
                            {$blog_post.data_map.body.content.output.output_text|strip_tags()|shorten(300)}
                            <a href={$blog_post.url_alias|ezurl} title="{$blog_post.data_map.title.content|wash}">Weiter lesen</a>
                        </div>
                    {/if}
                {/foreach}
            </div>
            {undef $blog_posts}
            {/foreach}
            {/if}
        </div>
    </div>

    <div class="class-project row">
        {if $file_folders_count}
        <div class="span7">
        {else}
        <div class="span10">
        {/if}
            {if $galleries_count}
            {foreach $galleries as $gallery}
            {def $images = fetch( 'content', 'tree', hash( 'parent_node_id', $gallery.node_id,
                                                           'sort_by', $node.sort_array,
                                                           'limit', '10',
                                                           'class_filter_type', 'include',
                                                           'class_filter_array', array( 'image' ) ) )}
            {def $first = $images.0
                 $big_image_class = 'gallery'
                 $image = $first.data_map.image.content[$big_image_class]}
            <div class="attribute-header">
                <h2><a href={$gallery.url_alias|ezurl} title="{$gallery.data_map.name.content|wash}">{$gallery.name|wash()}</a></h2>
            </div>

            <div class="block-type-gallery">

                <div class="block-gallery">
                    <div class="gallery-viewer">
                        <figure>
                            <img src={$image.url|ezroot} alt="{$first.name|wash()}" height="{$image.height}" width="{$image.width}" />
                            <figcaption>
                                <h3>
                                    <span class="counter"><span>1</span>/{$images|count}</span>
                                    <a href={$first.url_alias|ezurl}>{$first.name|wash()}</a>
                                </h3>
                                <div>
                                {if $first.data_map.caption.has_content}
                                    {attribute_view_gui attribute=$first.data_map.caption}
                                {/if}
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="gallery-navigator">
                        <a href="#" class="navig prev" style="opacity:0;"><span class="hide">&lt;</span></a>
                        <a href="#" class="navig next"><span class="hide">&gt;</span></a>

                        <img src={'fg-selected.png'|ezimage} alt="Selected indicator" class="cursor" />
                        <ul class="images">
                        {foreach $images as $k => $img}
                            <li>{node_view_gui view='gallery_item' thumb_class='gallerythumbnail' big_class=$big_image_class content_node=$img}</li>
                        {/foreach}
                        </ul>
                    </div>

                </div>
                {run-once}
                <script type="text/javascript">
                {literal}
                YUI(YUI3_config).use('ezgallery', 'event', function (Y) {
                    Y.on('domready', function () {
                        Y.all('.block-type-gallery').each(function () {
                            var g = new Y.eZ.Gallery({
                                title: 'h3 a',
                                caption: 'figcaption div',
                                autoFixSizes: false,
                                autoScrollOnSelect: false,
                                navigator: {
                                    gallery: this.one('.block-gallery')
                                },
                                initFunc: function () {
                                    var imgs = this.navigator.getImages();

                                    setTimeout(function () {
                                        imgs.each(function(elem) {
                                            (new Image).src = elem.getAttribute('data-gallery-src');
                                        });
                                    }, 0);
                                },
                                updateFunc: function (item) {
                                    var node = item.imageNode,
                                        t = this.container.one(this.conf.title),
                                        img = this.container.one(this.conf.image),
                                        cap = this.container.one(this.conf.caption);
                                        c = this.container.one(this.conf.counter);

                                    img.setAttribute('src', node.getAttribute('data-gallery-src'));
                                    img.setAttribute('height', node.getAttribute('data-gallery-height'));
                                    img.setAttribute('width', node.getAttribute('data-gallery-width'));
                                    img.setAttribute('alt', node.get('title'));
                                    t.setContent(node.get('title'));
                                    t.setAttribute('href', node.getAttribute('data-gallery-node-url'));
                                    c.setContent(item.index + 1);
                                    cap.setContent(node.one('figcaption').getContent());
                                }
                            });
                        });
                    });
                });
                
                {/literal}
                </script>
                {/run-once}
            </div>
            {undef $images $first $big_image_class $image}
            {/foreach}
            {/if}
        </div>

        {if $file_folders_count}
        {foreach $file_folders as $file_folder}
        {def $files = fetch( 'content', 'tree', hash( 'parent_node_id', $file_folder.node_id,
                                                         'sort_by', $node.sort_array,
                                                         'class_filter_type', 'include',
                                                         'class_filter_array', array( 'file' ) ) )}
        <div class="span3">
            <div class="attribute-header">
                <h2><a href={$file_folder.url_alias|ezurl} title="{$file_folder.data_map.name.content|wash}">{$file_folder.name|wash()}</a></h2>
            </div>
            <div class="attribute-event">
                {foreach $files as $file}
                    <h3>
                        <a href="{concat( 'content/download/', $file.data_map.file.contentobject_id, '/', $file.data_map.file.id,'/version/', $file.data_map.file.version , '/file/', $file.data_map.file.content.original_filename|urlencode )|ezurl( 'no' )}">{$file.name|wash()}</a>
                    </h3>
                    <div class="attribute-byline">
                        <p><span class="date">{$file.object.current.modified|l10n(shortdatetime)}</span></p>
                        <p><span class="file-size">{'File size:'|i18n( 'design/ezdemo/line/file' )} {$file.data_map.file.content.filesize|si( byte )}</span></p>
                    </div>
                {/foreach}
            </div>
        </div>
        {undef $files}
        {/foreach}
        {/if}
    </div>

    {if $donor_folders_count}
    {foreach $donor_folders as $donor_folder}
    {def $donors = fetch( 'content', 'tree', hash( 'parent_node_id', $donor_folder.node_id,
                                                   'sort_by', $node.sort_array,
                                                   'class_filter_type', 'include',
                                                   'class_filter_array', array( 'donor' ) ) )}
        <div class="class-project row">
            <div class="span10">
            <div class="attribute-header">
                <h2><a href={$donor_folder.url_alias|ezurl} title="{$donor_folder.data_map.name.content|wash}">{$donor_folder.name|wash()}</a></h2>
            </div>
            {foreach $donors as $donor}
                <a href={$donor.url_alias|ezurl} title="{$donor.data_map.name.content|wash}">
                {attribute_view_gui attribute=$donor.data_map.image image_class=gallerythumbnail}
                </a>
            {/foreach}
            </div>
        </div>
    {undef $donors}
    {/foreach}
    {/if}

{undef $blogs $file_folders $galleries $donor_folders $blogs_count $file_folders_count $galleries_count $donor_folders_count}

</section>
