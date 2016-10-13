<%-- 
    Document   : index
    Created on : Oct 13, 2016, 1:02:14 PM
    Author     : pedroreis
--%>
<%
    
    if (session.getAttribute("username") != null && !session.getAttribute("username").equals("")) {
        response.sendRedirect("feed.jsp");
    }
    
    else {
        response.sendRedirect("login.jsp");
    }
%>