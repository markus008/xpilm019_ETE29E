<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/employees">
        <html>
            <head>
                <title>Calls log</title>
                <style>
                    table {
                        font-family: arial, sans-serif;
                        border-collapse: collapse;
                        width: 100%;
                      }
                      
                      td, th {
                        border: 1px solid #dddddd;
                        text-align: left;
                        padding: 8px;
                      }
                      .container{
                        max-width: 600px;
                    }
                </style>
            </head>
            <body>
                <h1 style="text-align:center;">Calls log</h1>
                <div class="container">
                    <xsl:for-each select="employee">
                        <h2 style="text-align:center;">
                            <xsl:value-of select="first_name" />&#160;<xsl:value-of select="last_name" />
                            <xsl:if test="gender='Female'">
                                &#160;<b>&#9792;</b>
                            </xsl:if>
                        </h2>
                        <table>
                            <tr>
                                <td>Email</td>
                                <td>
                                    <xsl:value-of select="email" />
                                </td>
                            </tr>
                            <tr>
                                <td>Gender</td>
                                <td>
                                    <xsl:value-of select="gender" />
                                </td>
                            </tr>
                            <tr>
                                <td>Date of birth</td>
                                <td>
                                    <xsl:value-of select="dob" />
                                </td>
                            </tr>
                            <tr>
                                <td>City</td>
                                <td>
                                    <xsl:value-of select="city" />
                                </td>
                            </tr>
                            <tr>
                                <td>Company</td>
                                <td>
                                    <xsl:value-of select="company" />
                                </td>
                            </tr>
                        </table>
                        <h3>Mobile phones and call history</h3>
                        <xsl:for-each select="phone_numbers">
                            <xsl:for-each select="number">
                                <h4 style="text-align:center;"><i><xsl:value-of select="phone" />&#160;(<xsl:value-of select="typ" />) </i></h4>
                                <xsl:for-each select="call_history">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Time</th>
                                                <th>Call time</th>
                                                <th>To</th>
                                                <th>Roming</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <xsl:for-each select="call">
                                                <tr>
                                                    <td><xsl:value-of select="date"/></td>
                                                    <td><xsl:value-of select="time"/></td>
                                                    <td><xsl:value-of select="call_length"/></td>
                                                    <td><xsl:value-of select="to_number"/></td>
                                                    <xsl:choose>
                                                        <xsl:when test="roming='true'">
                                                            <td style="color: red;"><xsl:value-of select="roming"/></td>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <td><xsl:value-of select="roming"/></td>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </tr>
                                            </xsl:for-each>
                                        </tbody>
                                    </table>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>