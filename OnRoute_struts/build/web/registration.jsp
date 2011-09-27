<%-- 
    Document   : registration
    Created on : 27-may-2011, 20:11:58
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
        <title>New User</title>
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
        <h1>New User</h1>
        <html:form action="/registration">
            <div class="newform">
            <table>
                <tbody>
                    <tr>
                        <td>
                            <bean:write name="RegistrationForm" property="error" filter="false"/>
                            &nbsp;</td>
                    </tr>
                    <tr><td>Email</td></tr>
                    <tr><td><html:text property="email" styleId="email"></html:text></td></tr>
                    <tr><td>Password</td></tr>
                    <tr><td><html:password property="password" styleId="password"></html:password></td></tr>
                    <tr><td>Password confirmation</td></tr>
                    <tr><td><html:password property="repassword" styleId="repassword"></html:password></td></tr>
                    <tr><td>Name (Max. 30 Characters)</td></tr>
                    <tr><td><html:text property="name"></html:text></td></tr>
                    <tr><td>Surname (Max. 30 Characters)</td></tr>
                    <tr><td><html:text property="surname"></html:text></td></tr>
                    <tr><td>Gender (Max. 10 Characters)</td></tr>
                    <tr><td><html:text property="gender"></html:text></td></tr>
                    <tr><td>Country (Max. 30 Characters)</v></tr>
                    <tr><td><html:text property="country"></html:text></td></tr>
                    <tr>
                        <td class="actions"><html:submit value="Sign Up" styleId="SignUp" /></td>

                    </tr>
                </tbody>
            </table>
            </div>
        </html:form>
        <p id="back"><html:link action="/index" >Back</html:link></p>
    </body>
</html>
