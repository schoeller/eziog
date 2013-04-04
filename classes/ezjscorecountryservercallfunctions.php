<?php
/**
 * File containing the ezjscoreDemoServerCallFunctions class.
 *
 * @package ezjscore_demo
 * @version //autogentag//
 * @copyright Copyright (C) 2005-2009 eZ Systems AS. All rights reserved.
 * @license http://ez.no/licenses/new_bsd New BSD License
 */
 
class ezjscoreCountryServerCallFunctions extends ezjscServerFunctions
{
    public static function search( $args )
    {

        if ( isset( $args[0] ) )
        {
            $includeClasses = array( 'project' );
            $sortBy = array( "name", true );
            $attributeFilter  = array( array( 'project/country', '=', $args[0] ) );
            $params = array( 'SortBy' => $sortBy,
                             'ClassFilterType' => 'include',
                             'ClassFilterArray' => $includeClasses,
                             'AttributeFilter' => $attributeFilter);

            $parent_node_id = eZINI::instance( 'content.ini' )->variable( 'NodeSettings', 'RootNode' );
            $parent_node = eZContentObjectTreeNode::fetchByContentObjectID( $parentNodeId );
            $objects = eZContentObjectTreeNode::subTreeByNodeID( $params, $parent_node_id );
//            eZDebug::writeDebug( $objects );
            return ezjscAjaxContent::nodeEncode( $objects, $type='json' );
        }
 
        return "Request to server completed, 
                but you did not send any 
                post / function parameters!";
    }
}
?>
