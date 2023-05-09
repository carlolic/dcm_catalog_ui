xquery version "3.1";

declare namespace exist="http://exist.sourceforge.net/NS/exist";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace response="http://exist-db.org/xquery/response";

declare variable $exist:path external;
declare variable $exist:resource external;
declare variable $exist:controller external;
declare variable $exist:prefix external;
declare variable $exist:root external;

if ($exist:path eq "/") then
    (: forward root path to navigation.xq :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="cat-site/navigation.xq"/>
    </dispatch>

else
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <cache-control cache="no"/>
        <set-attribute name="$exist:prefix" value="{$exist:prefix}"/>
        <set-attribute name="$exist:controller" value="{$exist:controller}"/>
        <set-attribute name="$exist:root" value="{$exist:root}"/>
        <set-attribute name="betterform.filter.ignoreResponseBody" value="true"/>
    </dispatch>
