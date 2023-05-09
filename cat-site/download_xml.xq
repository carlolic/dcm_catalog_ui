xquery version "1.0" encoding "UTF-8";

declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";
declare namespace fn="http://www.w3.org/2005/xpath-functions";
declare namespace file="http://exist-db.org/xquery/file";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace app="http://kb.dk/this/app";
declare namespace ft="http://exist-db.org/xquery/lucene";

declare option exist:serialize "method=xml media-type=text/xml"; 
declare variable $document := request:get-parameter("doc", "");
declare variable $coll     := request:get-parameter("c","") cast as xs:string;
declare variable $database := $config:data-root;

let $list := 
for $doc in collection($database) 
where util:document-name($doc)=$document
return $doc

let $params := 
<parameters>
   <param name="hostname" value="{request:get-header('HOST')}"/>
</parameters>

for $doc in $list
return transform:transform($doc,doc(concat($config:cat-site-root,"/style/transforms/download_xml.xsl")),$params)
