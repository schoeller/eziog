{def $collection = cond( $collection_id, fetch( content, collected_info_collection, hash( collection_id, $collection_id ) ),
                          fetch( content, collected_info_collection, hash( contentobject_id, $node.contentobject_id ) ) )}

{set-block scope=global variable=title}{'Form %formname'|i18n( 'design/eziog/collectedinfo/form', , hash( '%formname', $node.name|wash() ) )}{/set-block}

<div class="attribute-header">
    <h1>{$collection.data_map.sender_name|wash}</h1>
</div>

<p>{'Thank you for your feedback.'|i18n( 'design/eziog/collectedinfo/contact_person' )}</p>

{if $error}

{if $error_existing_data}
<p>{'You have already submitted this form. The data you entered was:'|i18n('design/eziog/collectedinfo/contact_person')}</p>
{/if}

{/if}

{foreach $collection.attributes as $attribute}

<p><strong>{$attribute.contentclass_attribute_name|wash}:</strong> {attribute_result_gui view=info attribute=$attribute} </p>

{/foreach}

<p/>

<a href={$node.parent.url|ezurl}>{'Return to site'|i18n('design/eziog/collectedinfo/contact_person')}</a>
