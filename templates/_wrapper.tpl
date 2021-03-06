<!doctype html>
<html class="no-js" lang="en">
<head> 
	<meta charset="utf-8">

     <title>{$title|default:"PSU Mobile"}</title> 

	{* Web App Info *}
	<meta name="app-version" content="{$PHP.APP_VERSION}">
	<meta name="app-build-name" content="{$PHP.APP_BUILD_NAME}">
	<meta name="app-build-type" content="{$PHP.APP_BUILD_TYPE}">
	{* Web App Info *}

	{* Mobile Meta and Graphic Tags *}
	<meta name="HandheldFriendly" content="True">
	<meta name="MobileOptimized" content="320">

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="{"`$PHP.BASE_URL`/templates/images/xhigh/appicon.png"|cdn}">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="{"`$PHP.BASE_URL`/templates/images/high/appicon.png"|cdn}">
	<link rel="apple-touch-icon-precomposed" sizes="57x57" href="{"`$PHP.BASE_URL`/templates/images/medium/appicon.png"|cdn}">
	<link rel="apple-touch-icon-precomposed" href="{"`$PHP.BASE_URL`/templates/images/xhigh/appicon.png"|cdn}">
	<link rel="shortcut icon" href="{"`$PHP.BASE_URL`/templates/images/low/appicon.png"|cdn}">
	{* Mobile Meta and Graphic Tags *}

	{* jQuery Mobile Styles *}
	<link rel="stylesheet" href="//ajax.aspnetcdn.com/ajax/jquery.mobile/1.1.0/jquery.mobile-1.1.0.min.css">
	<link rel="stylesheet" href="{"`$PHP.BASE_URL`/templates/psu-mobile-jqm-theme.min.css"|cdn}">
	{* jQuery Mobile Styles *}

	{* PSU Icons - Custom Font *}
	<link rel="stylesheet" href="/app/core/css/psu-icons.css">
	{* PSU Icons - Custom Font *}

	{* PSU Mobile/Custom (Must be in this order) *}
	<link rel="stylesheet" href="{"`$PHP.BASE_URL`/templates/style.css"|cdn}">
	{* PSU Mobile/Custom *}

	{if $PHP.IS_DEV}
		<script>
			var isDev = true;
		</script>
	{else}
		<script>
			var isDev = false;
		</script>
	{/if}

	{* Necessary Global Tools *}
	{* Load these first. We need to use them for device detection and for other script loads *}
	<script src="{"`$PHP.BASE_URL`/js/global-tools.js"|cdn}"></script>
	{* Necessary Global Tools *}

	{* If the phonegap/cordova session variable is set, include the PhoneGap/Cordova javascript *}
	{if isset($smarty.session.phonegap) || isset($smarty.session.cordova)}

		{* Load the PhoneGap/Cordova JavaScript files *}
		{if isset($smarty.session.phonegap)}
			{assign var='clientFrameworkVersion' value=$smarty.session.phonegap}

			<script>
				var scriptName = 'phonegap';
			</script>
		{elseif isset($smarty.session.cordova)}
			{assign var='clientFrameworkVersion' value=$smarty.session.cordova}

			<script>
				var scriptName = 'cordova';
			</script>
		{/if}

		<script>

			// Use a try, in case the GlobalTools didn't load correctly
			try {
				if (GlobalTools.deviceOS() != 'other') {
					scriptName = '{$PHP.BASE_URL}/js/' + scriptName + '-' + '{$clientFrameworkVersion}' + '_' + GlobalTools.deviceOS();
				}
			}
			catch (e) {
				console.log(e);
			}

			// Actually write the script tag and load the JS
			document.write('<script src="' + scriptName + '.js"><\/script>');
		</script>
	{/if}


	{* jQuery *}
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	{* jQuery *}

	{* jQuery Mobile Configuration *}
	<script src="{"`$PHP.BASE_URL`/js/jquery.mobile.config.js"|cdn}"></script>
	{* jQuery Mobile Configuration *}

	{* jQuery Mobile *}
	<script src="//ajax.aspnetcdn.com/ajax/jquery.mobile/1.1.0/jquery.mobile-1.1.0.min.js"></script>
	{* jQuery Mobile *}

	{* Google Maps API *}
	{* Must be loaded in the HEAD, as it uses a document.write to load an external script *}
	<script src="//maps.google.com/maps/api/js?sensor=true"></script>
	{* Google Maps API *}

	<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">

</head> 
<body> 
	{* Grab the corresponding template, based on the content variable. *}
	{if $show_page}
		{include file="$show_page.tpl"}
	{* Otherwise, show the index. *}
	{else}
		{include file='index.tpl'}
	{/if}

	{* PSU Mobile/Custom *}
	<script src="{"`$PHP.BASE_URL`/js/modernizr.custom.12420.js"|cdn}"></script>
	<script src="{"`$PHP.BASE_URL`/js/jquery.easing.1.3.js"|cdn}"></script>
	<script src="{"`$PHP.BASE_URL`/js/jquery.animate-enhanced.min.js"|cdn}"></script>
	<script src="{"`$PHP.BASE_URL`/js/behavior.js"|cdn}"></script>

		{* If the phonegap/cordova session variable is set, include the PhoneGap/Cordova javascript *}
		{if isset($smarty.session.phonegap) || isset($smarty.session.cordova)}

			<script src="{"`$PHP.BASE_URL`/js/phonegap-cordova-logic.js"|cdn}"></script>

		{/if}

	{* PSU Mobile/Custom *}

	{* Google Analytics *}
	{literal}
	<script>
		var _gaq=[['_setAccount','UA-125829-17'],['_trackPageview']];
		(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
		g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
		s.parentNode.insertBefore(g,s)}(document,'script'));
	</script>
	{/literal}
	{* Google Analytics *}
</body>
</html>
