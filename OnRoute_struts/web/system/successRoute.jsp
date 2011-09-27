<%--
    Document   : success
    Created on : 27-may-2011, 20:33:58
    Author     : javidgon
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Congratulations!</title>
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
        <div class="field_without_errors">The route has been created. You'll find it in your list.</div>

        <p id="back"><html:link action="/index" >Back</html:link></p>
</body>
</html>
