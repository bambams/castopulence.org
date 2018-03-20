<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
        xmlns="http://www.w3.org/1999/xhtml"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:csc="http://castopulence.org/2010/03/content-page">
    <xsl:output
            method="xml"
            omit-xml-declaration="no"
            version="1.0"
            doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
            indent="yes"
            media-type="applicaion/xhtml+xml"
            />
    <xsl:template match="/csc:content">
        <html>
            <head>
                <meta http-equiv="Content-Type"
                        content="text/html; charset=utf-8" />
                <title>
                    <xsl:text>Castopulence Software - </xsl:text>
                    <xsl:value-of select="csc:heading" />
                </title>
                <link href="theme/jquery-ui-1.8.custom.css"
                        rel="stylesheet" type="text/css" />
                <link href="global.css" rel="stylesheet"
                        type="text/css" />
            </head>
            <body>
                <div id="header">
                    <h1>Castopulence Software</h1>
                    <div id="navigation">
                        <ul>
			    <!--<li>
                                <xsl:if test="csc:heading = 'News'">
                                    <xsl:attribute name="class">
                                        <xsl:value-of select="'current'" />
                                    </xsl:attribute>
                                </xsl:if>
                                <a href="news.html">News</a>
			    </li>-->
                            <li>
                                <xsl:if test="csc:heading = 'Projects'">
                                    <xsl:attribute name="class">
                                        <xsl:value-of select="'current'" />
                                    </xsl:attribute>
                                </xsl:if>
                                <a href="projects.html">Projects</a>
                            </li>
                            <li>
                                <xsl:if test="csc:heading = 'Downloads'">
                                    <xsl:attribute name="class">
                                        <xsl:value-of select="'current'" />
                                    </xsl:attribute>
                                </xsl:if>
                                <a href="downloads.html">Downloads</a>
                            </li>
                            <li>
                                <xsl:if test="csc:heading = 'About'">
                                    <xsl:attribute name="class">
                                        <xsl:value-of select="'current'" />
                                    </xsl:attribute>
                                </xsl:if>
                                <a href="about.html">About</a>
                            </li>
                            <li>
                                <xsl:if test="csc:heading = 'Contact'">
                                    <xsl:attribute name="class">
                                        <xsl:value-of select="'current'" />
                                    </xsl:attribute>
                                </xsl:if>
                                <a href="contact.html">Contact</a>
                            </li>
                            <xsl:comment>Personal blog though...</xsl:comment>
                            <li>
                                <a href="http://www.bambams.ca/"
                                        class="external">Blog</a>
                            </li>
                            <xsl:comment>...End of personal blog.</xsl:comment>
                            <li>
                                <xsl:if test="csc:heading = 'Donate'">
                                    <xsl:attribute name="class">
                                        <xsl:value-of select="'current'" />
                                    </xsl:attribute>
                                </xsl:if>
                                <a href="donate.html">Donate</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="content">
                    <div id="content_header">
                        <h2>
                            <a href="#">
                                <xsl:value-of select="csc:heading" />
                            </a>
                        </h2>
                    </div>
                    <div id="table-of-contents">
                        <div>
                            <h3>
                                <a href="#table-of-contents">Table of
                                        Contents</a>
                            </h3>
                        </div>
                        <ul>
                            <xsl:for-each select="csc:entry">
                                <xsl:variable name="href">
                                    <xsl:text>&#x23;</xsl:text>
                                    <xsl:value-of select="@id" />
                                </xsl:variable>
                                <li>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="$href" />
                                        </xsl:attribute>
                                        <xsl:value-of select="csc:title" />
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    <xsl:for-each select="csc:entry">
                        <div class="content_entry">
                            <xsl:attribute name="id">
                                <xsl:value-of select="@id" />
                            </xsl:attribute>
                            <div class="content_entry_header">
                                <xsl:variable name="href">
                                    <xsl:text>&#x23;</xsl:text>
                                    <xsl:value-of select="@id" />
                                </xsl:variable>
                                <h3>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="$href" />
                                        </xsl:attribute>
                                        <xsl:value-of select="csc:title" />
                                    </a>
                                </h3>
                                <xsl:if test="count(csc:last-updated-date)
                                        = 1">
                                    <span class="content_entry_date">
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="$href" />
                                            </xsl:attribute>
                                            <xsl:if test="csc:last-updated-date/@absolute">
                                                <xsl:attribute name="title">
                                                    <xsl:value-of select="csc:last-updated-date/@absolute" />
                                                </xsl:attribute>
                                            </xsl:if>
                                            <xsl:value-of
                                                    select="csc:last-updated-date" />
                                        </a>
                                    </span>
                                </xsl:if>
                                <br />
                                <xsl:if test="count(csc:author) = 1">
                                    <span class="content_entry_author">
                                        Posted by
                                        <xsl:value-of
                                                select="csc:author/@username" />
                                    </span>
                                </xsl:if>
                            </div>
                            <div class="content_entry_body">
                                <xsl:copy-of select="csc:body/*" />
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
                <div id="footer">
                    <p id="copyright">Copyright &#169; 2009-2015 Brandon McCaig</p>
                    <xsl:comment>Written with Vim. ;D</xsl:comment>
                    <p>
                        <a href="http://validator.w3.org/check?uri=referer">
                            <img src="img/valid-xhtml10-blue"
                                    alt="Valid XHTML 1.0 Strict"
                                    height="31" width="88" />
                        </a>
                    </p>
                    <div class="hacker-emblem">
                        <xsl:comment>
                        |_|0|_|
                        |_|_|0|
                        |0|0|0|
                        </xsl:comment>
                        <a href="http://www.catb.org/hacker-emblem/">
                            <img src="/img/glider.png" alt="hacker emblem" />
                        </a>
                    </div>
                </div>
                <script type="text/javascript"
                        src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"
                        ></script>
                <script type="text/javascript"
                        src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"
                        ></script>
                <script type="text/javascript"
                        src="/js/json2.js"></script>
                <script type="text/javascript"
                        src="/js/joose.mini.js"></script>
                <script type="text/javascript" src="global.js"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

