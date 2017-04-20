<%-- 
    Document   : login
    Created on : Oct 13, 2016, 5:36:46 PM
    Author     : pedroreis
--%>
<%
    
    // Redirects to the feed page if user is already logged
    
    if (session.getAttribute("id") != null && !session.getAttribute("id").toString().equals("0")) {
        response.sendRedirect("feed.jsp");
    }
    
%>

<% session.setAttribute("page", "login"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="includes/html_head.jsp" %>
    <body>
        <%@include file="includes/templates/header.jsp" %>
        <div class="container">
            <div class="main-login col-sm-6 col-sm-offset-3">
                <form class="form-horizontal" method="POST" action="user/login" accept-charset="UTF-8">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label label-login">Usuário:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="username" placeholder="Entrar com usuário" autofocus required>
                        </div>
                    </div>
                    <input type="submit" value="Logar" class="btn btn-primary col-sm-6 col-sm-offset-3 login-button"/>
                </form>
            </div>
            <div class="alert alert-danger hidden col-sm-6 col-sm-offset-3" role="alert">
                <p>Usuário não encontrado!</p>
            </div>
        </div>
        <script>
            if ("login-error" === "${loginstatus}") {
                loginError();
            }
        </script>
    </body>
</html>

<% session.setAttribute("loginstatus", "login-hold"); %>

