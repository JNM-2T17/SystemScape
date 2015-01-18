<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	
	<xsl:template match="contact_person[@position]">
		<xsl:value-of select="name" /><br />
		(<span class="position"><xsl:value-of select="@position"/></span>)
	</xsl:template>
	
	<xsl:template match="contact_person">
		<xsl:value-of select="name" />
	</xsl:template>
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Potential Clients</title>
				<link rel="stylesheet" type="text/css" href="xmlstyle.css" />
			</head>
			<body>
				<div id="header" class="headfoot">
					Potential Clients
				</div>
				<div id="pagewrapper">
					<xsl:for-each select="client_list/client">
						<div class="client">
							<div class="name">
								<h1><xsl:value-of select="company_name" /></h1>
								<h1><xsl:value-of select="client_name" /></h1>
								<xsl:choose>
									<xsl:when test="count(project_name) > 0">
										<xsl:for-each select="project_name">
											<h3><xsl:value-of select="." /></h3>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<h3>&lt;Project Name Pending&gt;</h3>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<table>
								<caption>Contact Info</caption>
								<tr>
									<th><span>Contact Person</span></th>
									<th><span>Contact Details</span></th>
								</tr>
								<xsl:choose>
									<xsl:when test="count(contact/contact_person)> 0">
										<xsl:for-each select="contact/contact_person">
											<tr>
												<td>
													<xsl:apply-templates select="." />
												</td>
												<td>
													<xsl:choose>
														<xsl:when test="count(contact_details) > 0">								
															<xsl:for-each select="contact_details">
																<p>
																	<span class="contacttype">
																		<xsl:value-of select="./@type" />
																	</span>
																	: <xsl:value-of select="." />
																</p>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>
															<p>No contact info given</p>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td>No Contact Persons</td>
											<td>N/A</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</table>
						</div>
					</xsl:for-each>
				</div>
				<div id="footer" class="headfoot">
					<span id="foottext">
						Design, DTD, XSL, CSS code, and Palette <i>&quot;Dragonfire&quot;</i> by Austin Fernandez.
					</span>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>