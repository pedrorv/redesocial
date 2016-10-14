<%-- 
    Document   : timeline.jsp
    Created on : Oct 14, 2016, 1:35:21 PM
    Author     : pedroreis
--%>
<%
    
    // Redirects to the login page if user isn't already logged
    
    if (session.getAttribute("username") == null || session.getAttribute("username").toString() == "") {
        response.sendRedirect("login.jsp");
    }
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="includes/html_head.jsp" %>
    <body>
        <%@include file="includes/templates/header.jsp" %>
        <div class="container">
            <h3>Timeline do usuário: <span>${username}</span></h3>
        </div>
    </body>
</html>
