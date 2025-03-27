<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:include href="libreria.xsl"/>
    <!-- Plantilla que dado una fecha la escribe en otro formato -->
    <xsl:template match="pedido/@fecha">
        <xsl:variable name="anio" select="substring(., 1, 4)"/>
        <xsl:variable name="mes" select="substring(., 6, 2)"/>
        <xsl:variable name="dia" select="substring(., 9, 2)"/>
        <xsl:value-of select="$dia"/> de
        <xsl:choose>
            <xsl:when test="$mes='01'">enero</xsl:when>
            <xsl:when test="$mes='02'">febrero</xsl:when>
            <xsl:when test="$mes='03'">marzo</xsl:when>
            <xsl:when test="$mes='04'">abril</xsl:when>
            <xsl:when test="$mes='05'">mayo</xsl:when>
            <xsl:when test="$mes='06'">junio</xsl:when>
            <xsl:when test="$mes='07'">julio</xsl:when>
            <xsl:when test="$mes='08'">agosto</xsl:when>
            <xsl:when test="$mes='09'">septiembre</xsl:when>
            <xsl:when test="$mes='10'">octubre</xsl:when>
            <xsl:when test="$mes='11'">noviembre</xsl:when>
            <xsl:when test="$mes='12'">diciembre</xsl:when>
        </xsl:choose> de <xsl:value-of select="$anio"/>
    </xsl:template>

    <!-- Plantilla que dado un pedido lo escribe en una tabla -->
    <xsl:template match="/pedido">
        <html>
            <head>
                <xsl:call-template name="meta">
                    <xsl:with-param name="titulo" select="'Pedidos Alberto Méndez Núñez'"/>
                </xsl:call-template>
                <link href="/css/estilos.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
            <header>
                <h1>Pedido ID:<xsl:value-of select="@idPedido"/></h1>
                <h3>Fecha:<xsl:value-of select="@fecha"/></h3>

                <div class="lista">
                <label for="lista">Fabricante:</label>
                <select id="lista" name="lista">
                    <option value="Todos">Todos</option>
                    <option value="F001">F001</option>
                    <option value="F012">F012</option>
                 </select>
            </div>
            </header>
                <main>
                    <h2><img src="{concat('images/',@codigo,' Fabricante: ',fabricantes/fabricante/@nombre)}"/></h2>
            <xsl:call-template name="tabla"/>
            <xsl:apply-templates select="tractor"/>
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tractor">
        <tr>
                <td><img src="{concat('images/',componente/@referencia,'.png')}"/></td>
                <td><xsl:value-of select="componente/@referencia"/></td>
                <td><xsl:value-of select="componentes/componente/@nombre"/></td>
                <td><xsl:value-of select="componente/fechaEntrega"/></td>
                <td><xsl:value-of select="componente/peso"/></td>
                <td><xsl:value-of select="componente/numeroSerie"/></td>
                <td><xsl:value-of select="componente/kmMaximos"/></td>
                <td><xsl:value-of select="componente/cantidad"/></td>
        </tr>
    </xsl:template>

    <xsl:template name="tabla">
        <tr>
            <th></th>
            <th>Referencia</th>
            <th>Descripción</th>
            <th>Fecha Entrega</th>
            <th>Peso</th>
            <th>Número de Serie</th>
            <th>Km Máximos</th>
            <th>Cantidad</th>
        </tr>
    </xsl:template>
    </xsl:stylesheet>