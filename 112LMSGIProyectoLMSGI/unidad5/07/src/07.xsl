<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:include href="../../lib/libreria.xsl"/>
    <xsl:template match="/prediccion">
        <html>
            <head>
                <xsl:call-template name="meta">
                    <xsl:with-param name="titulo" select="'07 XSLT Tiempo'"/>
                </xsl:call-template>
                <table>
                    <caption>EL tiempo. <xsl:value-of select="upper-case(concat(municipio/nombre,' ' , '(',municipio/provincia, ')'  ))"/></caption>
                    <xsl:call-template name="tabla-encabezado"/>
                    <xsl:apply-templates select="dia"/>
                </table>
            </head>
            <body>
                <h1>Prediccion por municipio</h1>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="dia">
            <tr>
                <td><xsl:value-of select="substring(@fecha,9,2)"/></td>
                <td><xsl:value-of select="concat(prob_precipitacion,'%')"/></td>
                <td><img src="{concat('images/',estado_cielo,'.gif')}" alt="{@descripcion}"/></td>
                <td><span class="tmin"><xsl:value-of select="temperatura/minima"/></span>
                <xsl:text>/</xsl:text>
                <span class="tmax"><xsl:value-of select="temperatura/maxima"/></span>
                </td>
                <td><img src="{concat('images/',viento/direccion,'.gif')}" alt="{viento/direccion}"/></td>
                <xsl:text></xsl:text>
                <xsl:value-of select="viento/velocidad"/>
            </tr>
    </xsl:template>
    <xsl:template name="tabla-encabezado">
        <tr>
            <th>Dia</th>
            <th>Prob Precip</th>
            <th>Estado del cielo</th>
            <th>Temperatura (ºC)</th>
            <th>Viento (Km/h)</th>
        </tr>
    </xsl:template>
</xsl:stylesheet>