<%--
    Document   : insertRoute
    Created on : 29-may-2011, 17:45:40
    Author     : javidgon
--%>
<%@page import="model.onRouteDB"%>
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
        <title>Show User</title>
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
        <h1>Show User</h1>
        <div class="newform">
            <table>
                <tbody>
                    <tr><th>Email</th>
                        <td><%= ((RegistrationForm) session.getAttribute("user")).getEmail()%> </td></tr>
                    <tr><th>Name</th>
                        <td><%= ((RegistrationForm) session.getAttribute("user")).getName()%></td></tr>
                    <tr><th>Surname</th>
                        <td><%= ((RegistrationForm) session.getAttribute("user")).getSurname()%> </td></tr>
                    <tr><th>Gender</th>
                        <td><%= ((RegistrationForm) session.getAttribute("user")).getGender()%> </td></tr>
                    <tr><th>Country</th>
                        <td><%= ((RegistrationForm) session.getAttribute("user")).getCountry()%> </td></tr>

                </tbody>
            </table>
        </div>

        <h2>Routes</h2>

        <div id="participants">

            <%
                 List l = onRouteDB.getRoutesForUser(((RegistrationForm) session.getAttribute("user")).getEmail());

                 Iterator it = l.iterator();

                 if (l.size() == 0) {

            %><h3 style="color:white">This user hasn't subscribed to any route yet.</h3><%                                    } else {

                                 while (it.hasNext()) {

                                     String p = (String) it.next();

            %><h3 style="color:white"><html:img src="images/map.png" alt="Map" width="30px"/>&nbsp;<%= p%></h3><%

                     }
                 }

            %>


        </div>

        <p id="back"><html:link action="/users" >Back</html:link></p>
        <%} else {%>
        <h3>You don't have enough rights. </h3>

        <% }%>

    </body>
</html>
