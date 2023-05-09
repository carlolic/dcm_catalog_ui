xquery version "3.1";

(:~
 : A set of helper functions to access the application context from
 : within a module.
 :)
module namespace config="https://github.com/peterstadler/dcm_catalog_ui/config";

declare namespace repo="http://exist-db.org/xquery/repo";
declare namespace expath="http://expath.org/ns/pkg";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace mei="http://www.music-encoding.org/ns/mei";
declare namespace output="http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace map="http://www.w3.org/2005/xpath-functions/map";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace session="http://exist-db.org/xquery/session";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace system="http://exist-db.org/xquery/system";


(: 
    Determine the application root collection from the current module load path.
:)
declare variable $config:app-root as xs:string := 
    let $rawPath := replace(system:get-module-load-path(), '/null/', '//')
    let $modulePath :=
        (: strip the xmldb: part :)
        if (starts-with($rawPath, "xmldb:exist://")) then
            if (starts-with($rawPath, "xmldb:exist://embedded-eXist-server")) then
                substring($rawPath, 36)
            else if (contains($rawPath, "/xmlrpc/")) then
                substring-after($rawPath, "/xmlrpc")
            else
                substring($rawPath, 15)
        else
            $rawPath
    return
        substring-before($modulePath, "/cat-site")
;

(:
 : hard coded reference to the default location.
 : that should be improved!
 :)
declare variable $config:data-root as xs:string := '/db/apps/mermeid-data';

(:
 : declare a default profile to use if no request parameter is given
 :)
declare variable $config:default-profile as xs:string := 'cnw';

(:
 : root collection of the XQuery modules and the project specific subcollections
 :)
declare variable $config:cat-site-root as xs:string := $config:app-root || '/cat-site';
