<?php

// Generic response (don't force the trailing slash: this should catch any accidental laziness)
respond( '/?', function( $request, $response, $app ){
	// Display the feedback template
	$app->tpl->assign( 'show_page', 'iframe' );
	$app->tpl->display( '_wrapper.tpl' );
});
