<?php /* #?ini charset="utf-8"?

[DisplaySettings]
# result   - Display IC result, for instance poll result or your form data
# redirect - Redirect to a specific url
# node     - Redirect back to content node
Display=result
# Matches class id or identifier to information collection type
DisplayList[]
#DisplayList[poll]=result
DisplayAttribute=collection_display
# The url to redirect to if DisplayHandling is set to redirect
RedirectURL=/
# Matches class id or identifier to information collection type
RedirectURLList[]
RedirectURLAttribute=collection_redirect
[EmailSettings]
SendEmailList[contact_person]=enabled
[InfoSettings]
TypeList[contact_person]=contact_person

*/ ?>
