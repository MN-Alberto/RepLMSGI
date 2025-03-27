<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:include href="../../../unidad5/lib/libreria.xsl"/>
    <xsl:template match="/lfm/topalbums" mode="#all">
        <html>
            <head>
                <xsl:call-template name="meta">
                    <xsl:with-param name="titulo" select="'Sabina: Alberto Méndez Núñez'"/>
                </xsl:call-template>
            </head>
            <body>
                <header>
                <h1>LAST.FM</h1>
                <h2><xsl:value-of select="@artist"/></h2>
                </header>
                <main>
                    <h3><xsl:text>Álbumes</xsl:text></h3>
                    <div id="principal">
                        <xsl:for-each select="album">
                            <div class="caja_album">
                                <img src="{image[@size="large"]/text()}" alt="{name/text()}"/>
                                <div class="texto">
                                    <p><a href="{url/text()}"><xsl:value-of select="name"/></a></p>
                                    <xsl:for-each select="artist">
                                        <p><xsl:value-of select="name"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </main>
            </body>
        </html>
        

    </xsl:template>
    </xsl:stylesheet>