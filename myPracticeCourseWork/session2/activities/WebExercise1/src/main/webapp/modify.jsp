<%-- 
    Document   : modify
    Created on : 9 Oct 2021, 22:40:33
    Author     : epick
--%>

<%@ page import="org.solent.oodd.webexercise1.model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    // retrieve the stored users list from the session
    List<User> users = (List<User>) session.getAttribute("users");
    if (users == null) {
        users = new ArrayList<User>();
        session.setAttribute("users", users);
    }

    String name = request.getParameter("userName");
    String address = request.getParameter("userAddress");
    String index = request.getParameter("index");
    int i = Integer.parseInt(index);
    User user = users.get(i);

    // find what action to perform on the page
    String action = request.getParameter("action");

    if ("modifyUser".equals(action)) {
        user.setName(name);
        user.setAddress(address);
    } 
  
   

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>YOUARE MOTIFDIDFIYNG THE THING BTW </h1>
        <form action="./modify.jsp" method="get"> 
            <input type="text" name="userName" value="<%=user.getName()%>">
            <input type="text" name="userAddress" value="<%=user.getAddress()%>">
            <input type="hidden" name="action" value="modifyUser">
            <input type="hidden" name="index" value="<%=index%>">
            <button type="submit" >modify user</button>
            
        </form>
            
               <br>
        <form action="./jspexample3b2.jsp" method="get">
            <button type="submit" >return to user list</button>
        </form> 
        <br>
                   
    </body>
</html>
