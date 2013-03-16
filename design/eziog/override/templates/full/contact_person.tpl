{set scope=global persistent_variable=hash('top_menu', true(),
                                           'show_path', true(),
                                           'left_menu', true(),
                                           'extra_menu', true())}

<section class="content-view-full">
    <article class="class-call-to-action">
        <div class="attribute-header">
            <h1>{$node.name|wash()}</h1>
        </div>
        <div class="row">
            <div class="span3">
                {attribute_view_gui image_class=articlethumbnail attribute=$node.data_map.image}
            </div>
            <div class="span7">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <form method="post" action={"content/action"|ezurl}>
                    <div class="row">
                        <div class="span10">
                        {include name=Validation uri='design:content/collectedinfo_validation.tpl'
                                 class='message-warning'
                                 validation=$validation collection_attributes=$collection_attributes}
                        </div>
                        <div class="attribute-sender-sender_name">
                            <div class="span3">
                                {$node.data_map.sender_name.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.sender_name}
                            </div>
                        </div>
                        <div class="attribute-sender-email_from">
                            <div class="span3">
                                {$node.data_map.email_from.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.email_from}
                            </div>
                        </div>
                        <div class="attribute-sender-subject">
                            <div class="span3">
                                {$node.data_map.subject.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.subject}
                            </div>
                        </div>
                        <div class="attribute-sender-message">
                            <div class="span3">
                                {$node.data_map.message.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.message}
                            </div>
                        <div class="attribute-sender-copy">
                            <div class="span3">
                                {$node.data_map.copy_to_sender.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.copy_to_sender}
                            </div>
                        </div>
                    </div>
                    <div class="content-action">
                        <input type="submit" class="btn btn-warning pull-right" name="ActionCollectInformation" value="{"Submit"|i18n("design/eziog/full/call_to_action")}" />
                        <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
                        <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
                        <input type="hidden" name="ViewMode" value="full" />
                    </div>
                </form>
            </div>
        </div>
    </article>
</section>
