<%-- 
    Document   : jspexample3
    Created on : 6 Oct 2021, 16:04:58
    Author     : epick
THIS EXAMPLE SHOWS HOW OBJECTS CAN BE STORED IN THE SESSION
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

    // find what action to perform on the page
    String action = request.getParameter("action");

    if ("removeUser".equals(action)) {
        int i = Integer.parseInt(index);
        users.remove(i);
    } else if ("addUser".equals(action)) {
        User user = new User();
        user.setName(name);
        user.setAddress(address);
        users.add(user);
                
        
                }
  
   

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example 3</title>
    </head>
    <body>
        <h1>JSP Example 3: User list</h1>

        <h2>user list</h2>
        
        
        <table style="width:20%; border: 5px solid black;" >
            <tr>
                <th>
                User
                </th>
            </tr>
            
            
            <tr>
                <% for (int idx = 0; idx < users.size(); idx++) {
                    User user = users.get(idx);
            %>
            ...
            <tr>
                <td><%=idx + 1%></td>
                <td><%=user.getName()%></td>
                <td><%=user.getAddress()%></td>
            </tr>
            
        </tr>
            <tr>

                <td>
                    <form action="./jspexample3b2.jsp" method="get">
                    <input type="hidden" name="index" value="<%=idx%>">
                    <input type="hidden" name="action" value="removeUser">
                    <button type="submit" >remove</button>
        </form> 
                    
                    <form action="./modify.jsp" method="get">
                    <input type="hidden" name="index" value="<%=idx%>">
                        
                    <button type="submit" >modify</button>
                          
                    </form>
                </td>
            </tr>
            <%
            }
        %>
        </table>
        
        <h2>commands</h2>
        <form action="./jspexample3b2.jsp" method="get">
            <p>user name <input type="text" name="userName" value=""></p>
            <p>user address <input type="text" name="userAddress" value=""></p>
            <input type="hidden" name="action" value="addUser">
            <button type="submit" >add name to list</button>
        </form> 
        <br>



    </body>
</html>

