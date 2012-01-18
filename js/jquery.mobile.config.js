// Bind events to be triggered BEFORE jQuery Mobile loads/executes
$(document).bind('mobileinit', function() {
	// Set jQuery mobile settings
	//$.mobile.touchOverflowEnabled = true;
	$.mobile.fixedToolbars.setTouchToggleEnabled(false);
	//$.mobile.addBackBtn = true;
	$.mobile.page.prototype.options.backBtnText = 'back';
	$.mobile.page.prototype.options.backBtnTheme = 'c';
});
