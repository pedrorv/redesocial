<%-- 
    Document   : logout
    Created on : Oct 13, 2016, 5:48:20 PM
    Author     : pedroreis
--%>

<%
    // Logout current user
    
    session.setAttribute("username", "");
    response.sendRedirect("index.jsp");
    
%>