xquery version "1.0" encoding "UTF-8";

module  namespace  layout="http://kb.dk/this/app/layout";

declare variable $layout:coll     := request:get-parameter("c","") cast as xs:string;



declare function layout:head($title as xs:string,
                             $additions as node()*
			) as node() 
{
  let $head :=
  <head>
    <title>{$title}</title>
      
    <meta http-equiv="Content-Type" content="application/xhtml+xml;charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    
    <link rel="icon" type="image/vnd.microsoft.icon" href="favicon.ico" />
      
    <link type="text/css" href="style/dcm.css" rel="stylesheet" />
    <link type="text/css" href="style/cnw/cnw.css" rel="stylesheet" />

   {$additions}

    <link href="jquery/jquery-ui-1.10.3/css/base/jquery-ui.css" 
       rel="stylesheet" 
       type="text/css"/>

    <link href="jquery/jquery-ui-1.10.3/css/style.css" 
       rel="stylesheet"  
       type="text/css"/>
      
    <script type="text/javascript" src="js/confirm.js">
      //
    </script>
      
    <script type="text/javascript" src="js/swap_num_type.js">
      //
    </script>

    <script type="text/javascript" src="js/checkbox.js">
      //
    </script>
      
    <script type="text/javascript" src="js/publishing.js">
      //
    </script>

    <script type="text/javascript" src="jquery/jquery-ui-1.10.3/js/jquery-1.9.1.js">
      //
    </script>

    <script type="text/javascript" src="jquery/jquery-ui-1.10.3/js/jquery-ui-1.10.3.custom.js">
      //
    </script>
    <script type="text/javascript" src="jquery/jquery-ui-1.10.3/slider.js">
      //
    </script>

     <script type="text/javascript">
     // <!--
     var _gaq = _gaq || [];
     _gaq.push(['_setAccount', 'UA-1269676-1']);
     _gaq.push(['_trackPageview']);
     _gaq.push(['_setDomainName', 'www.kb.dk']);
	    
     (function() {
       var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
       ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
      // -->
     </script>
  </head>

  return $head

};

declare function layout:page-head(
                        $title as xs:string,
			$subtitle as xs:string) as node()
{
  let $header :=
  <div id="header">
    <div class="kb_logo">
      <a href="http://www.kb.dk" title="Det Kongelige Bibliotek"><img
         id="KBLogo"
	 title="Det Kongelige Bibliotek" 
	 alt="KB Logo" src="style/images/kb_white.png"/><img
	 id="KBLogo_print"
	 title="Det Kongelige Bibliotek" 
	 alt="KB Logo" src="style/images/kb.png"/></a>
    </div>
    <h1>
    <a style="text-decoration:none;" 
       href="http://www.kb.dk/dcm/cnw.html" 
       title="{$title} – {$subtitle}">{$title}</a></h1>
    <h2><a style="text-decoration:none;" href="http://www.kb.dk/dcm/cnw.html" title="{$title} – {$subtitle}">{$subtitle}</a></h2>
  </div>

  return $header

};

declare function layout:page-menu($mode as xs:string) as node()
{

  let $menudoc  :=
  <div id="menu" class="noprint"> {
  for $anchor in doc(concat("/db/cat-site/",$layout:coll,"/menu.html"))/div/a
    return 
      if(contains($anchor/@href,$mode)) then
	<a href="{$anchor/@href}" class="selected">{$anchor/text()}</a>
      else
	<a href="{$anchor/@href}" class="">{$anchor/text()}</a>
  } </div>
  return $menudoc

};


declare function layout:page-footer($mode as xs:string) as node()
{
  let $footer :=
  <div id="footer" style="text-align: center; height: auto; padding: 10px 20px;">
    <a href="http://www.kb.dk/dcm" title="DCM" 
    style="text-decoration:none;"><img 
    style="border: 0px; vertical-align:middle;" 
    alt="DCM Logo" 
    src="style/images/dcm_logo_small_white.png"
    id="dcm_logo"/><img 
    style="border: 0px; vertical-align:middle;" 
    alt="DCM Logo" 
    src="style/images/dcm_logo_small.png"
    id="dcm_logo_print"
    /></a>
    2014 Danish Centre for Music Publication | The Royal Library | P.O. Box 2149 | Copenhagen K, Denmark | <a name="www.kb.dk" id="www.kb.dk" href="http://www.kb.dk/dcm">www.kb.dk/dcm</a><br/> 
  <span class="creativecommons" style="font-size: .65em;">
  This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/">Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported License</a>
  </span>
  </div>

  return $footer

};

