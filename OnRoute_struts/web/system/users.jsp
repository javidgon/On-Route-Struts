<%-- 
    Document   : users
    Created on : 29-may-2011, 18:31:27
    Author     : javidgon
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ page session="true" import="java.util.*, com.myapp.struts.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta HTTP-EQUIV="content-type" CONTENT="text/html; charset=UTF-8">
        <title>Listing users</title>
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
                <% if (null != session.getAttribute("email")) {%>
        <h2>Listing users</h2>

        <table id="listing">
            <tr>
                <th>Email</th>
                <th>Name</th>
                <th>Surname</th>
                <th>Gender</th>
                <th>Country</th>
                <th></th>
                <th></th>
                <th></th>
            </tr>

            <%String name = null;
            Iterator it = ((List) session.getAttribute("users")).iterator();


                 while (it.hasNext()) {

                     RegistrationForm i = (RegistrationForm) it.next();


                     name = i.getEmail();
                     pageContext.setAttribute("user", name);
         %>

            <tr id="row">
                <th><%= i.getEmail()%></th>
                <td><%= i.getName()%></td>
                <td><%= i.getSurname()%></td>
                <td><%= i.getGender()%></td>
                <td><%= i.getCountry()%></td>

                <% if (session.getAttribute("email").equals("root@onroute.com")) {%>
                <td><html:link action="/showUser" paramName="user" paramId="user">Show</html:link></td>
                <td><html:link action="/editUser" paramName="user" paramId="user">Edit</html:link></td>
                <td><html:link action="/destroyUser" paramName="user" paramId="user">Destroy</html:link></td>
                <% } else {%>
                <td><html:link action="/showUser" paramName="user" paramId="user">Show</html:link></td>
                <td></td>
                <td></td>
                <% }%>
            </tr>
            <% }%>
        </table>

                <p id="back"><html:link action="/index" >Back</html:link></p>


        <%} else {%>
        <h3>You don't have enough rights. </h3>

        <% }%>




    </body>
</html>
