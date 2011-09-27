<%--
    Document   : users
    Created on : 29-may-2011, 18:31:27
    Author     : javidgon
--%>
<%@page import="model.onRouteDB"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ page session="true" import="java.util.*, com.myapp.struts.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listing routes</title>
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
                <% if (null != session.getAttribute("email")) {
                                String name = null;
                                Iterator it = ((List) session.getAttribute("routes")).iterator();
                                if (((List) session.getAttribute("routes")).size() > 0) {
                %>
        <h2>Listing routes</h2>

        <table id="listing">
            <tr>
                <th>Name</th>
                <th>Country</th>
                <th>Province</th>
                <th>City</th>
                <th>Description</th>
                <th></th>
                <th></th>
                <th></th>
            </tr>

            <% 

                while (it.hasNext()) {

                   InsertRouteForm i = (InsertRouteForm) it.next();

                     name = i.getName();
                     pageContext.setAttribute("route", name);

            %>



            <tr id="row">
                <th><%= i.getName()%></th>
                <td><%= i.getCountry()%></td>
                <td><%= i.getProvince()%></td>
                <td><%= i.getCity()%></td>
                <td><%= i.getDescription()%></td>

                <% if (session.getAttribute("email").equals("root@onroute.com")) {%>
                <td><html:link action="/showRoute" paramName="route" paramId="route">Show</html:link></td>
                <td><html:link action="/editRoute" paramName="route" paramId="route">Edit</html:link></td>
                <td><html:link action="/destroyRoute" paramName="route" paramId="route">Destroy</html:link></td>
                <% } else {%>
                <td><html:link action="/showRoute" paramName="route" paramId="route">Show</html:link></td>
                <td  style="color:green; font-weight:bold"><% if (onRouteDB.getParticipant((String) session.getAttribute("email"), i.getName()) != null) {
                         out.write("Already joined");
                     }%></td>
                <td></td>
                <% }%>
            </tr>
            <% }

                                } else {%><div class="field_without_errors">Currently There isn't any route created. Create one <html:link action="/insertRouteAccess">Here</html:link>!</div> <%}%>
        </table>

        <p id="back"><html:link action="/index" >Back</html:link></p>


        <%} else {%>
        <h3>You don't have enough rights. </h3>

        <% }%>




    </body>
</html>
