{* Faq - Line view *}
{def $content_size = '7'}

<div class="content-view-line">
    <article class="class-faq row">

    <div class="span{$content_size}">
        <div class="attribute-header">
            <h2>
                {$node.data_map.question.content|wash()}
            </h2>
        </div>

        <div class="attribute-short">
            {attribute_view_gui attribute=$node.data_map.answer}
        </div>
    </div>

    </article>
</div>

{undef $content_size}
