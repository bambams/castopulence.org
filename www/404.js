jQuery(function() {
    var cmd = jQuery("#command");
    var cmdtext = "You aren't actually at a shell prompt. :(";
    var stdout = "echo '" + cmdtext.replace(/'/g, "'\\''") + "'";

    if(jQuery.browser.msie || jQuery.browser.webkit ||
            jQuery.browser.opera)
    {
        jQuery(".cursor").blink(200);
    }

    jQuery(document).keypress(function() {
        if(stdout.length > 0)
        {
            cmd.text(cmd.text() + stdout.charAt(0));
            stdout = stdout.substring(1);
        }
        else
        {
            $(document).unbind("keypress");

            cmd.text(cmd.text() + "\n" + cmdtext +
                    "\n[root@castopulence:www]# ");
        }
    });
});

