<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Response</title>
</head>
<body>

<table style="border: 1px solid black;">
    <tr>
        <th>Application scope</th>
        <th>Session scope</th>
        <th>Request scope</th>
    </tr>
    <tr >
        <%
            Enumeration<String> request_attributes = request.getServletContext().getAttributeNames();
            if (request_attributes.hasMoreElements()){
            %>
        <td style="background-color: yellow;width: 200px">
            <%

                while (request_attributes.hasMoreElements()) {
                    String request_attribute = request_attributes.nextElement();
            %><%=  request_attribute+" - "+request.getServletContext().getAttribute(request_attribute)%><br/><%
            }
        %>
        </td>
        <%
            }
        %>
        <%
            Enumeration<String> session_attributes = request.getSession().getAttributeNames();
            if (session_attributes.hasMoreElements()){
        %>
        <td style="background-color: deepskyblue;width: 200px">
            <%

                while (session_attributes.hasMoreElements()) {
                    String session_attribute = session_attributes.nextElement();
                    %><%=  session_attribute+" - "+request.getSession().getAttribute(session_attribute)%><br/><%
                }
            String jid = "";
            for(Cookie cookie : request.getCookies()){
                if(cookie.getName().equals("JSESSIONID")) jid = cookie.getValue();
            }
            %>
            <%=  " JSESSIONID = " + jid %>
        </td>
        <%
            }
        %>
        <%
            Enumeration<String> application_attributes = request.getAttributeNames();
            if (application_attributes.hasMoreElements()){
        %>
        <td style="background-color: floralwhite;width: 200px">
            <%
                while (application_attributes.hasMoreElements()) {
                    String application_attribute = application_attributes.nextElement();
            %><%=  application_attribute+" - "+request.getAttribute(application_attribute)%><br/><%
            }
        %>
        </td>
        <%
            }
        %>
    </tr>
</table>


</body>
</html>