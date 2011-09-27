<%--
    Document   : registration
    Created on : 27-may-2011, 20:11:58
    Author     : javidgon
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" import="java.util.*, com.myapp.struts.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Index</title>
        <style type="text/css">
            @import "css/index.css";
        </style>
    </head>
    <body>
        <div id="logo"> <h1>On Route: Search your travel here!</h1><span id="user_nav">
                <% if (null != session.getAttribute("email")) {%>
	    Logged in as <%= session.getAttribute("email")%>.
                <html:link action="/logout">Log out </html:link>
                <% } else {%>
                <html:link action="/signupAccess">Sign up </html:link> or
                <html:link action="/loginAccess">Log in </html:link>

                <% }%></span></div>
        <table
            <tr><td><h3 id="button"><html:link action ="/routes">Available Routes</html:link></h3></td><td id="img" rowspan="4"><html:image src="images/paisaje.jpg" alt="Imagen"></html:image></td></tr>
            <tr><td><h3 id="button"><html:link action="/users">Registered Users</html:link></h3></td></tr>
            <tr><td><h3 id="new"><html:link action="/signupAccess">Are you a new user?</html:link></h3></td></tr>
            <tr><td><h3 id="new"><html:link action="/insertRouteAccess">Did you think about a new route?</html:link></h3></td></tr>
        </table>
        <div id="footer"><strong>Proyecto Struts</strong> - Programaci&oacute;n Web Avanzada</div>
    </body>
</html>
