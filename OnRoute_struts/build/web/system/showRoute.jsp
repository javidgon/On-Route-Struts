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
        <title>Show Route</title>
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
        <h1>Show Route</h1>
        <div class="newform">
            <table>
                <tbody>
                    <tr><th>Name</th>
                        <td><%= ((InsertRouteForm) session.getAttribute("route")).getName()%> </td></tr>
                    <tr><th>Country</th>
                        <td><%= ((InsertRouteForm) session.getAttribute("route")).getCountry()%> </td></tr>
                    <tr><th>Province</th>
                        <td><%= ((InsertRouteForm) session.getAttribute("route")).getProvince()%> </td></tr>
                    <tr><th>City</th>
                        <td><%= ((InsertRouteForm) session.getAttribute("route")).getCity()%> </td></tr>
                    <tr><th>Description</th>
                        <td><%= ((InsertRouteForm) session.getAttribute("route")).getDescription()%> </td></tr>

                </tbody>
            </table>
        </div>

        <% if (onRouteDB.getParticipant((String) session.getAttribute("email"), ((InsertRouteForm) session.getAttribute("route")).getName()) == null) {%>

        <div id="subscribe"><html:link action="/join">Join</html:link></div>

        <%  } else {%>
        <div id="quit"><html:link action="/unsubscribe">Unsubscribe</html:link></div>
        <% }%>
        <h2>Participants</h2>

        <div id="participants">

            <%
                 List l = onRouteDB.getParticipants(((InsertRouteForm) session.getAttribute("route")).getName());

                 Iterator it = l.iterator();

                 if (l.size() == 0) {

            %><h3 style="color:white">There isn't any participant yet</h3><%                                    } else {

                                        while (it.hasNext()) {

                                            String p = (String) it.next();

            %><h3 style="color:white"><html:img src="images/user.png" alt="Map" width="35px"/>&nbsp;<%= p%></h3><%

                     }
                 }

            %>


        </div>




        <p id="back"><html:link action="/routes" >Back</html:link></p>
        <%} else {%>
        <h3>You don't have enough rights. </h3>

        <% }%>

    </body>
</html>
