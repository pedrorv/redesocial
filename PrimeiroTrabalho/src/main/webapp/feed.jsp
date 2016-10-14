<%-- 
    Document   : feed
    Created on : Oct 13, 2016, 4:58:28 PM
    Author     : pedroreis
--%>
<%
    
    // Redirects to the news feed if user is already logged
    
    if (session.getAttribute("username") == null || session.getAttribute("username").toString() == "") {
        response.sendRedirect("index.jsp");
    }
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/normalize.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/styles.css"/>
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>      
        <script src="js/script.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Raleway:400,700" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid header">
            <div class="custom-nav">
                <ul class="header-navigation">
                    <li><a href="index.jsp">Feici</a></li>
                    <li><a href="user/logout">Logout</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <h3>Usuário logado: <span>${username}</span></h3>
        </div>
    </body>
</html>
