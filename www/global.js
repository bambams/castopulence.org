var bam = {
    openAnchorDialog:
        function(a) {
            var href = a.attr("href");
            var title = a.attr("title") ||
                    "Castopulence Software - Dialog";
            var src =
"<div class=\"dialog anchor-dialog\" title=\"" + title + "\">" +
"   <object data=\"" + href + "\" type=\"text/html\">" +
"       <p>Your browser does not support the &lt;object&gt; tag. " +
"           Click <a href=\"" + href + "\">here</a> to open the link " +
"           in the current window." +
"       </p>" +
"   </object>" +
"</div>";
            var dialog = jQuery(src);

            jQuery(document).append(dialog);

            dialog.dialog();

            return dialog;
        }
};

jQuery(function() {
    // If Internet Explorer, present a disclaimer to the user.
    if(jQuery.browser.msie)
    {
        var majorVersion = parseInt(jQuery.browser.version.charAt(0), 10);

        var html = "<div class=\"ieDisclaimer\">" +
                "<h3>Choose A Better Web Browser</h3>" +
                "<p>You appear to be using Internet Explorer (according to <a class=\"external\" href=\"http://jquery.com/\">jQuery</a>). Internet Explorer is a poor excuse for a Web browser that has been plagued with security vulnerabilities and a lack of supported Web standards for years. Microsoft, the corporation that develops it, puts its profits before your freedoms. The Web is about sharing and should be open. Not following open standards makes the Web more expensive for everyone involved (developers, like myself, and users, like you).</p>" +
                "<p>For more information, please visit these links (Castopulence Software is not affiliated with these Web sites; we just support their cause):</p>" +
                "<ul>" +
                    "<li><a class=\"external\" href=\"http://abetterbrowser.org/\">http://abetterbrowser.org</a></li>" +
                    "<li><a class=\"external\" href=\"http://browsehappy.com/\">http://browsehappy.com</a></li>" +
                "</ul>" +
                "<p>It's not just good for me. It's good for you too. Other Web browsers support far more advanced features and perform better as well.</p>" +
            "</div>";

        jQuery(html).hide().insertAfter("#header").slideDown();
    }

    jQuery("a.dialog").click(function(E) {
        E.preventDefault();
        bam.openAnchorDialog(jQuery(E.currentTarget));
    });

    jQuery("a.external:not(.dialog)").click(function(E) {
        E.preventDefault();
        window.open(jQuery(E.currentTarget).attr("href"));
    });
});

