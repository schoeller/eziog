{set-block scope=root variable=subject}{"Donation information from %1 %2"|i18n("design/eziog/collectedinfomail/form",,array($collection.data_map.first_name|wash, $collection.data_map.last_name|wash))}{/set-block}

{if $collection.data_map.copy_to_sender.content|eq(1)}
{set-block scope=root variable=email_receiver}{$collection.data_map.email_address.content}{/set-block}
{set-block scope=root variable=email_bcc_receivers}{$collection.data_map.receiver.content}{/set-block}
{else}
{set-block scope=root variable=email_receiver}{$collection.data_map.receiver.content}{/set-block}
{/if}

{debug-log var=$email_receiver msg='object email_receiver contents'}

{* Set this to redirect to another node
{set-block scope=root variable=redirect_to_node_id}2{/set-block}
*}

{"The following information was collected"|i18n("design/eziog/collectedinfomail/form")}:

{foreach $collection.attributes as $attribute}
{$attribute.contentclass_attribute_name|wash}:
{attribute_result_gui view=info attribute=$attribute}

{/foreach}
