<?php /*

[ODFSettings]
ZipPath=/usr/bin/

[ODFExport]
UseTemplate=true
#TemplateName=eziog.ott
ClassAttributeMappingToHeader=enabled

[ODFImport]
DefaultImportClass=article
DefaultImportImageClass=image
RegisteredClassArray[]
RegisteredClassArray[]=article
RegisteredClassArray[]=image
RegisteredClassArray[]=blog_post
RegisteredClassArray[]=project

[article]
DefaultImportTitleAttribute=title
DefaultImportBodyAttribute=body
Attribute[]
Attribute[title]=title
Attribute[short_title]=short_title
Attribute[intro]=intro
Attribute[body]=body
Attribute[image]=image
Attribute[caption]=caption
Attribute[publish_date]=publish_date

[image]
DefaultImportTitleAttribute=name
DefaultImportBodyAttribute=image
Attribute[]
Attribute[name]=name
Attribute[caption]=caption
Attribute[image]=image

[blog_post]
DefaultImportTitleAttribute=title
DefaultImportBodyAttribute=body
Attribute[]
Attribute[title]=title
Attribute[body]=body
Attribute[publication_date]=publication_date

[project]
DefaultImportTitleAttribute=name
DefaultImportBodyAttribute=description
Attribute[]
Attribute[name]=name
Attribute[short_name]=short_name
Attribute[image]=image
Attribute[intro]=intro
Attribute[description]=description
Attribute[project_code]=project_code
Attribute[target_group]=target_group
Attribute[project_finish]=project_finish
Attribute[partner]=partner

[DocumentType]
AllowedTypes[]
AllowedTypes[]=odt
ConvertTypes[]

*/ ?>
