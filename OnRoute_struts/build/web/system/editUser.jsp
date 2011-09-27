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
        <title>Edit User</title>
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
        <html:form action="/editUserConfirmation">
            <div class="newform">
                <table>
                    <tbody>
                        <tr>
                            <td>
                                <bean:write name="EditUserForm" property="error" filter="false"/>
                                &nbsp;</td>
                        </tr>
                        <tr><td>Email</td></tr>
                        <tr><td><%= ((RegistrationForm)session.getAttribute("user")).getEmail() %></td></tr>
                        <tr><td>Password</td></tr>
                        <tr><td><html:password property="password" value=""></html:password></td></tr>
                        <tr><td>Re-Password</td></tr>
                        <tr><td><html:password property="repassword" value=""></html:password></td></tr>
                        <tr><td>Name (Max. 30 Characters)</td></tr>
                        <tr><td><html:text property="name" value=""></html:text></td></tr>
                        <tr><td>Surname (Max. 30 Characters)</td></tr>
                        <tr><td><html:text property="surname" value=""></html:text></td></tr>
                        <tr><td>Gender (Max. 10 Characters)</td></tr>
                        <tr><td><html:text property="gender" value=""></html:text></td></tr>
                        <tr><td>Country (Max. 30 Characters)</td></tr>
                        <tr><td><html:text property="country" value=""></html:text></td></tr>
                        <tr><td class="actions"><html:submit value="Edit User"/></td>

                        </tr>
                    </tbody>
                </table>
            </div>
        </html:form>

        <p id="back"><html:link action="/users" >Back</html:link></p>
        <%} else {%>
        <h3>You don't have enough rights. </h3>

        <% }%>

    </body>
</html>
