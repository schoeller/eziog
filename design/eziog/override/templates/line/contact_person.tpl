{* Contact person - Line view *}

<div class="content-view-line">
    <article class="class-contact_person row">

    {if $node.data_map.image.has_content}
    <div class="span2">
        <div class="attribute-image">
            {attribute_view_gui image_class=articlethumbnail attribute=$node.data_map.image}
        </div>
    </div>
        {set $size = $size|sub(2)}
    {/if}

    <div class="span{$size}">
        <div class="attribute-header">
            <h2>
                {$node.data_map.title.content|wash()}
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
            <span class="email">
                <div class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#contact{$node.parent_node_id}" href="#contact{$node.node_id}">{attribute_view_gui attribute=$node.data_map.email_to}</a>
                </div>
            </span>
        </div>
    </div>

    </article>

    <div id="contact{$node.node_id}" class="accordion-body collapse">
        <div class="accordion-inner">
            <div class="row">
                <div class="span{$size}">
                    <div class="attribute-short">

{* validation *}
       {include name=Validation uri='design:content/collectedinfo_validation.tpl'
                class='message-warning'
                validation=$validation collection_attributes=$collection_attributes}

       <form method="post" action={"content/action"|ezurl}>

{* Sender Name *}
       <h4>{$node.data_map.sender_name.contentclass_attribute.name}</h4>
       <div class="attribute-sender-name">
               {attribute_view_gui attribute=$node.data_map.sender_name}
       </div>

{* Email Address *}
       <h4>{$node.data_map.email_from.contentclass_attribute.name}</h4>
       <div class="attribute-email">
               {attribute_view_gui attribute=$node.data_map.email_from}
       </div>

{* Subject *}
       <h4>{$node.data_map.subject.contentclass_attribute.name}</h4>
       <div class="attribute-email">
               {attribute_view_gui attribute=$node.data_map.subject}
       </div>

{* Message *}
       <h4>{$node.data_map.message.contentclass_attribute.name}</h4>
       <div class="attribute-email">
               {attribute_view_gui attribute=$node.data_map.message}
       </div>

{* Copy to sender *}
       <h4>{$node.data_map.copy_to_sender.contentclass_attribute.name}</h4>
       <div class="attribute-email">
               {attribute_view_gui attribute=$node.data_map.copy_to_sender}
       </div>

{* Form buttons - Processing *}
       <div class="content-action">
           <input type="submit" class="defaultbutton" name="ActionCollectInformation" value="{"Send form"|i18n("design/eziog/full/feedback_form")}" />
           <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
           <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
           <input type="hidden" name="ViewMode" value="full" />
       </div>
       </form>

                      </div>
                </div>
            </div>
        </div>
    </div>

</div>

