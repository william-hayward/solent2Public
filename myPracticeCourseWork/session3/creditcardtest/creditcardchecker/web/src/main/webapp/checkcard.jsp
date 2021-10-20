<%-- 
    Document   : checkcard
    Created on : 28 Jul 2021, 17:13:43
    Author     : cgallen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="solent.ac.uk.ood.examples.cardcheck.CardValidationResult" %>
<%@ page import="solent.ac.uk.ood.examples.cardcheck.RegexCardValidator" %>

<%
    String creditcardno = request.getParameter("creditcardno");
    
    CardValidationResult result = RegexCardValidator.isValid(creditcardno);

    // TODO CREATE LOGIC TO CHECK A CARD HERE
    // TIP - LOOK AT THE CODE IN TestRegexCardValidator.java
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Check Credit Card</h1>
   
        <form action="checkcard.jsp" method="post">
            <input type="text" value="<%=creditcardno%>" name="creditcardno">
            <label for="creditcard">credit card</label><br>
            <button type="submit" value="Submit">asss</button>
        </form>
            
            <% if (result.isValid()) {%>
            <p>"<%= result.getCardNo()%>" is a valid uwu issued by <%= result.getCardType()%> </p>
            <%
            } else {
            %>
            <p>"<%= result.getCardNo()%>" is invalid yo : <%= result.getError()%> </p>
            <%
                   }
            %>


    </body>
</html>
