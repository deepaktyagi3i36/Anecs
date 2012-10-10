// Slide function for slideable windows
jQuery(function() {
	if(jQuery("div.b-icon-slide") == null){
		return;
	}
	jQuery("div.b-icon-slide").each(function() {
		jQuery(this).click(function() {
			element = jQuery(this);
			if (element.hasClass("a-slide-hidden")) {
				element.parent().parent().parent().children(".a-slide").show("fast", function() {
					element.removeClass("a-slide-hidden");
					element.attr("src", "/i/icon-up.png");
				});
			} else {
				element.parent().parent().parent().children(".a-slide").hide("fast", function() {
					element.addClass("a-slide-hidden");
					element.attr("src", "/i/icon-down.png");
				});
			}
		});
	});
});

// Slide function for sitemap
jQuery(function() {
	if(jQuery(".b-float-wrapper a") == null){
		return;
	}

	jQuery(".b-float-wrapper a").each(function() {
		if (jQuery(this).parent().parent().children("UL").get(0) != null) {
			jQuery(this).html(jQuery(this).html() + ' | &#9660;');
		}
		jQuery(this).click(function() {
			if (jQuery(this).attr("collapsed") == 1) {
				jQuery(this).attr("collapsed", 0);
				html = jQuery(this).html();
				jQuery(this).html(html.substring(0, html.length - 1) + '&#9660;');
				jQuery(jQuery(this).parent().parent().children("UL").get(0)).slideDown("fast");
			} else {
				jQuery(this).attr("collapsed", 1);
				html = jQuery(this).html();
				jQuery(this).html(html.substring(0, html.length - 1) + '&#9650;');
				jQuery(jQuery(this).parent().parent().children("UL").get(0)).slideUp("fast");
			}
			return false;
		});
	});
});
