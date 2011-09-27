<%--
    Document   : insertRoute
    Created on : 29-may-2011, 17:45:40
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Route</title>
        <style type="text/css">
            @import "../css/index.css";
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
                <% if (null != session.getAttribute("email")) {%>
        <h1>Edit Route</h1>
        <html:form action="/editRouteConfirmation">
            <div class="newform">
                <table>
                    <tbody>
                        <tr>
                            <td>
                                <bean:write name="EditRouteForm" property="error" filter="false"/>
                                &nbsp;</td>
                        </tr>
                        <tr><td>Name (Max. 70 characters)</td></tr>
                        <tr><td><%= ((InsertRouteForm)session.getAttribute("route")).getName() %></td></tr>
                        <tr><td>Country</td></tr>
                        <tr><td><html:text property="country" value=""></html:text></td></tr>
                        <tr><td>Province</td></tr>
                        <tr><td><html:text property="province" value=""></html:text></td></tr>
                        <tr><td>City</td></tr>
                        <tr><td><html:text property="city" value=""></html:text></td></tr>
                        <tr><td>Description (Max. 200 characters)</td></tr>
                        <tr><td><html:textarea property="description" value="" cols="30" rows="20"></html:textarea></td></tr>
                        <tr><td class="actions"><html:submit value="Edit Route"/></td>

                        </tr>
                    </tbody>
                </table>
            </div>
        </html:form>

        <p id="back"><html:link action="/routes" >Back</html:link></p>
        <%} else {%>
        <h3>You don't have enough rights. </h3>

        <% }%>

    </body>
</html>
