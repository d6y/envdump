<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.regex.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">

<html>
	<head>
		<style>

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



<hr />

<h2>Env properties</h2>

	<table>

		<tr><th>Property</th><th>Value</th></tr>

	<%
		java.util.Map<String,String> envs = System.getenv();
		java.util.Set<String> ekeys =  envs.keySet();
		for( String ekey: ekeys) {
			String value = envs.get(ekey);
	  	%>
			<tr>
				<td><%=ekey%></td><td><%=value%></td>
			</tr>
			<%
		}
	%>

	</table>


<hr />

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

<hr />


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


<hr />

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


<hr />

<h1>My IP</h1>

Port from port.http: <%= System.getProperty("port.http")%>  <br/>


Port from app_port: <%= System.getenv("app_port")%>  <br/>

<%
 Matcher m = Pattern.compile(".*-port (\\d+) .*").matcher(System.getProperty("sun.java.command"));
 String jcPort = m.matches() ? m.group(1) : "No match";
%>
Port from <code>sun.java.command</code>: <%= jcPort %> <br/>


<%
File portsDir = new File(System.getenv("PWD"), ".genapp/ports");
%>
Port files (num files = <%= portsDir.list().length %>) in <code>.genapp/ports</code>: <% for (String s : portsDir.list() ) { %> <%= s %> <% } %> <br />

<%

try
{
// Kill me now
URL website = new URL("http://instance-data/latest/meta-data/public-hostname");
URLConnection connection = website.openConnection();
BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
StringBuilder publicHost = new StringBuilder();
String inputLine;
while ((inputLine = in.readLine()) != null) publicHost.append(inputLine);
in.close();
%>
Host: <%= publicHost.toString() %>  <br /> <%
}
catch (Exception x)
{
	%> x <%
}

%>


</body>
</html>
