<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">

<html>
	<head>
		<style>
			body {
				background-color: #eef0f6;
				margin: 0px;
				font-size: .9em;
			}
			
			a, a:hover, a:visited { color:black; text-decoration:none; }
			a, a:visited { border-bottom: 1px dotted black; }
			a:hover { border-bottom: 1px solid black; }
				
			#content { 
				background-color: white; 
				margin: 0px 250px 0px 20px;
				padding: 20px;
				border-top: 1px solid #6A829E;
				border-left: 1px solid #6A829E;
				border-right: 1px solid #6A829E;
				border-bottom: 1px solid #6A829E;
				height: 800px;
			}
			h2.title { margin: 0px; padding: 20px;}
			
			#sidebar {
				position: absolute;
				right: 10px; top: 60px;
				width: 200px;
				padding: 0 10px 10px 10px;				
			}
			#sidebar h3 { margin: 10px 0px 5px 0px; }
			#sidebar p { margin: 10px 5px 10px 5px;}
			#sidebar li { list-style: none; margin: 0px; padding: 5px 0px 5px 0px;}
			#sidebar ul { margin: 5px; padding: 0px;}			
			#sidebar li { padding: 5px 0px 5px 0px;}			
			#sidebar table { width: 160px; margin: 5px;}			
			#sidebar td { border-bottom: 1px solid #6A829E; padding: 2px 5px 2px 5px;}
			#sidebar .col2 { text-align: right; }
		</style>
	</head>
<body>
	
	<h1>Environment dump</h1>


	<h2>System properties</h2>

	<table>

		<tr><th>Property</th><th>Value</th></tr>

	
	<%   
		// yuck
		java.util.Properties p = System.getProperties(); 
		java.util.Enumeration e = p.propertyNames();
		while (e.hasMoreElements()) {
			String name = (String)e.nextElement(); 
			String value = System.getProperty(name);
			%>
			<tr>
				<td><%=name%></td><td><%=value%></td>
			</tr>
			<%
		}
	%>

	</table>

	<h2>Request values</h2>
	<table>

	<tr><th>Name</th><th>Value</th></tr>	
	<tr><td>getServerName</td><td><%= request.getServerName() %></td></tr>
  <tr><td>getServerPort</td><td><%= request.getServerPort() %></td></tr>
	<tr><td>isSecure</td><td><%= request.isSecure() %></td></tr>
	<tr><td>getScheme</td><td><%= request.getScheme() %></td></tr>
	<tr><td>getRemoteHost</td><td><%= request.getRemoteHost() %></td></tr>
	<tr><td>getRemoteAddr</td><td><%= request.getRemoteAddr() %></td></tr>
	<tr><td>getProtocol</td><td><%= request.getProtocol() %></td></tr>
	<tr><td>getContentType</td><td><%= request.getContentType() %></td></tr>
	<tr><td>getAuthType</td><td><%= request.getAuthType() %></td></tr>
  <tr><td>getContextPath</td><td><%= request.getContextPath() %></td></tr>
  </table>

  <h2>Request params</h2>

  <table>

	<tr><th>Name</th><th>Value</th></tr>
	
	<%   

		java.util.Enumeration e2 = request.getParameterNames();
		while (e2.hasMoreElements()) {
			String name = (String)e2.nextElement(); 
			String[] values = request.getParameterValues(name);
			%>
			<tr>
				<td><%=name%></td><td><%=values%></td>
			</tr>
			<%
		}
	%>
  
  </table>


  <h2>Header values</h2>

  	<table>

	<tr><th>Name</th><th>Value</th></tr>
	
	<%   

		java.util.Enumeration e3 = request.getHeaderNames();
		while (e3.hasMoreElements()) {
			String name = (String)e3.nextElement(); 
			String value = request.getHeader(name);
			%>
			<tr>
				<td><%=name%></td><td><%=value%></td>
			</tr>
			<%
		}
	%>
  
  </table>


	<h2>Servlet context parameters</h2>
	
	<table>

		<tr><th>Property</th><th>Value</th></tr>

	<%   
		java.util.Enumeration a = application.getInitParameterNames();
		while (a.hasMoreElements()) {
			String name = (String)a.nextElement(); 
			String value = application.getInitParameter(name);
			%>
			<tr>
				<td><%=name%></td><td><%=value%></td>
			</tr>
			<%
		}
	%>

	</table>

	
</body>
</html>
