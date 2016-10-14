<%-- 
    Document   : login
    Created on : Oct 13, 2016, 5:36:46 PM
    Author     : pedroreis
--%>
<%
    
    // Redirects to the feed page if user is already logged
    
    if (session.getAttribute("username") != null && session.getAttribute("username").toString() != "") {
        response.sendRedirect("feed.jsp");
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="includes/html_head.jsp" %>
    <body>
        <%@include file="includes/templates/header.jsp" %>
        <div class="container">
            <div class="main-login col-sm-6 col-sm-offset-3">
                <form class="form-horizontal" method="GET" action="user/login">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label label-login">Usuário:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="username" placeholder="Entrar com usuário" autofocus required>
                        </div>
                    </div>
                    <input type="submit" value="Logar" class="btn btn-primary col-sm-6 col-sm-offset-3 login-button"/>
                </form>
            </div>
        </div>
    </body>
</html>
