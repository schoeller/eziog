<?php /*

[OpenGraph]
# used to define PHP handler classes for any eZ Publish
# datatype to be used in Open Graph meta tags.
DataTypeHandlers[]
DataTypeHandlers[ezgmaplocation]=ngOpenGraphGmapLocation
DataTypeHandlers[ezimage]=ngOpenGraphImage
DataTypeHandlers[eztext]=ngOpenGraphText
DataTypeHandlers[ezobjectrelation]=ngOpenGraphObjectRelation
DataTypeHandlers[ezobjectrelationlist]=ngOpenGraphObjectRelationList
DataTypeHandlers[ezxmltext]=ngOpenGraphXml

[General]

# detailed Open Graph protocol docs available
# here: https://developers.facebook.com/docs/opengraphprotocol/

# Enable debug output
Debug=enabled

# Allows the use of Open Graph to connect with Facebook
# by using few additional meta fields
FacebookCompatible=true

# Defines which classes output Open Graph metadata in page head
Classes[]
Classes[]=article

# GenericData settings apply to all classes
[GenericData]
# "app_id", "default_admin" and "admins" settings are used
# if FacebookCompatible is set to true, in which case app_id
# or admins (and thus default_admin) is required.

# app_id maps to fb:app_id meta field
app_id=123

# default_admin setting is used to control which admin will be the main one.
# should not be changed once it's set, to adhere to Facebook recommendations.
# these two settings map to fb:admins meta field
default_admin=123
admins[]
admins[]=456
admins[]=789

# each item defined in General/Classes array has one block with LiteralMap
# and AttributeMap settings. LiteralMap translates to meta fields literally,
# e.g. og:type meta field will have 'company' set as it's content.
# AttributeMap translates eZ Publish attribute content to meta field content
# by use of PHP handler classes
[article]
LiteralMap[]
# og:type is required by Open Graph, you can define it either here or in
# AttributeMap setting. Should not be changed once the page gets 10 likes
LiteralMap[og:site_name]=Ingenieure ohne Grenzen e.V.
LiteralMap[og:type]=Ingenieure ohne Grenzen e.V.
LiteralMap[og:country-name]=Germany

AttributeMap[]
AttributeMap[og:description]=intro
# og:title is required by Open Graph, you can define it either here or in
# LiteralMap setting. Should not be changed once the page gets 10 likes
AttributeMap[og:title]=title
AttributeMap[og:image]=image
AttributeMap[og:latitude]=location;latitude
AttributeMap[og:longitude]=location;longitude
#AttributeMap[og:street-address]=address
#AttributeMap[og:postal-code]=postal_code
#AttributeMap[og:locality]=city
#AttributeMap[og:email]=email
#AttributeMap[og:phone_number]=phone
#AttributeMap[og:fax_number]=fax
# og:image is required by Open Graph, you can only define it here.
# Creates 'opengraph' image alias. You can use Image or Object Relation (image)
# fields in your content class to specify a single image. For multiple
# images, use the Object Relations field.  If the object does
# not have content in used ezimage attribute, e.png), a default image is used
# (ngopengraph/design/standard/images/opengraph_default_image.png).
# Requirement: existing ezimage attribute
#AttributeMap[og:image]=logo
# For multiple images, use Object Relations field, set the 1st parameter below
# to the name of the attribute, and the 2nd parameter to "related_images"
#AttributeMap[og:image]=my_images;related_images

#AttributeMap[og:region]=county_relation
# The following notation is used if one eZ Publish attribute is used to generate
# two or more Open Graph meta fields in which case, item after ';' sign controls
# what to output. This notation uses getDataMember method instead of getData method
# in PHP handler classes.
#AttributeMap[og:latitude]=gmaps_location;latitude
#AttributeMap[og:longitude]=gmaps_location;longitude

*/ ?>
