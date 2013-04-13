(function($) {
	$.fn.blink = function(options) {
		var defaults = { delay:500 };

		options = $.extend(defaults, options);

		this.each(function() {
			var obj = $(this);

			setInterval(function() {
                        var k = 'visibility';

                        if($(obj).css(k) == 'visible')
                        {
                            $(obj).css(k, 'hidden');
                        }
                        else
                        {
                            $(obj).css(k, 'visible');
                        }
                    }, options.delay);
		});

        return $;
	}
}(jQuery));
