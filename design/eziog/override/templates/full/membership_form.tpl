{set scope=global persistent_variable=hash('top_menu', true(),
                                           'show_path', true(),
                                           'left_menu', true(),
                                           'extra_menu', true())}

<section class="content-view-full">
    <article class="class-membership_form">
        <div class="attribute-header">
            <h1>{$node.name|wash()}</h1>
        </div>
        <div class="row">
            <div class="span3">
                {attribute_view_gui image_class=articlethumbnail attribute=$node.data_map.image}
            </div>
            <div class="span7">
                {attribute_view_gui attribute=$node.data_map.intro}
            </div>
        </div>
        {if $node.data_map.body.has_content}
        <div class="row">
            <div class="span10">
                {attribute_view_gui attribute=$node.data_map.body}
            </div>
        </div>
        {/if}
        <div class="row">
            <div class="span10">
                <form method="post" action={"content/action"|ezurl}>
                    <div class="row">
                        <div class="span10">
                        {include name=Validation uri='design:content/collectedinfo_validation.tpl'
                                 class='message-warning'
                                 validation=$validation collection_attributes=$collection_attributes}
                        </div>
                        <div class="attribute-sender-gender">
                            <div class="span3">
                                {$node.data_map.gender.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.gender}
                            </div>
                        </div>
                        <div class="attribute-sender-first_name">
                            <div class="span3">
                                {$node.data_map.first_name.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.first_name}
                            </div>
                        </div>
                        <div class="attribute-sender-last_name">
                            <div class="span3">
                                {$node.data_map.last_name.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.last_name}
                            </div>
                        </div>
                        <div class="attribute-sender-postal_address">
                            <div class="span3">
                                {$node.data_map.postal_address.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.postal_address}
                            </div>
                        </div>
                        <div class="attribute-sender-email_address">
                            <div class="span3">
                                {$node.data_map.email_address.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.email_address}
                            </div>
                        </div>
                        <div class="attribute-sender-phone">
                            <div class="span3">
                                {$node.data_map.phone.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.phone}
                            </div>
                        </div>
                        <div class="attribute-sender-message">
                            <div class="span3">
                                {$node.data_map.message.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.message}
                            </div>
                        </div>

                        <div class="attribute-sender-profession">
                            <div class="span3">
                                {$node.data_map.profession.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.profession}
                            </div>
                        </div>
                        <div class="attribute-sender-date_of_birth">
                            <div class="span3">
                                {$node.data_map.date_of_birth.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.date_of_birth}
                            </div>
                        </div>
                        <div class="attribute-sender-yearly_contribution">
                            <div class="span3">
                                {$node.data_map.yearly_contribution.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.yearly_contribution}
                            </div>
                        </div>

                        <div class="attribute-sender-account_owner">
                            <div class="span3">
                                {$node.data_map.account_owner.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.account_owner}
                            </div>
                        </div>
                        <div class="attribute-sender-account_number">
                            <div class="span3">
                                {$node.data_map.account_number.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.account_number}
                            </div>
                        </div>
                        <div class="attribute-sender-bank_number">
                            <div class="span3">
                                {$node.data_map.bank_number.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.bank_number}
                            </div>
                        </div>
                        <div class="attribute-sender-bank">
                            <div class="span3">
                                {$node.data_map.bank.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.bank}
                            </div>
                        </div>
                        <div class="attribute-sender-bank_withdrawal">
                            <div class="span3">
                                {$node.data_map.bank_withdrawal.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.bank_withdrawal}
                            </div>
                        </div>
                        <div class="attribute-sender-transaction">
                            <div class="span3">
                                &nbsp;
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.transaction}
                            </div>
                        </div>

                        <div class="attribute-sender-terms">
                            <div class="span3">
                                {$node.data_map.terms.contentclass_attribute.name}
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.terms}
                            </div>
                        </div>

                        <div class="attribute-sender-terms_detail">
                            <div class="span3">
                                &nbsp;
                            </div>
                            <div class="span7">
                                {attribute_view_gui attribute=$node.data_map.terms_detail}
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
