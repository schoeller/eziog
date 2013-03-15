{* Contact person feedback form - Full view *}

{def $size = '10'}

<section class="content-view-full">
    <article class="class-feedback-form">

<div class="row">
    <div class="span10">
        <div class="attribute-header">
            <h1>{$node.name|wash()}</h1>
        </div>
    </div>
</div>
<div class="row">
    <div class="span10">
{* validation *}
       {include name=Validation uri='design:content/collectedinfo_validation.tpl'
                class='message-warning'
	validation=$validation collection_attributes=$collection_attributes}
</div>
</div>

<div class="row">
    {if $node.data_map.image.has_content}
    <div class="span3">
        <div class="attribute-image">
            {attribute_view_gui image_class=articlethumbnail attribute=$node.data_map.image}
        </div>
    </div>
        {set $size = '7'}
    {/if}

    <div class="span{$size}">
        <div class="attribute-header">
            <h3>
                {$node.data_map.last_name.content|wash()}&nbsp;{$node.data_map.first_name.content|wash()}
            </h3>
        </div>
    </div>
    <div class="span{$size}">
        <div class="attribute-short">
            {attribute_view_gui attribute=$node.data_map.description}
        </div>
    </div>
</div>

<div class="row">
    <div class="span10">
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

    </article>
</section>
