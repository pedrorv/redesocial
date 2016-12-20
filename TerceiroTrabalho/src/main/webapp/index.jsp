<%-- 
    Document   : index
    Created on : Oct 13, 2016, 1:02:14 PM
    Author     : pedroreis
--%>
<%
    
    // Redirects to the news feed if user is already logged
    
    if (session.getAttribute("id") != null && !session.getAttribute("id").toString().equals("0")) {
        response.sendRedirect("painel.jsp");
    }
    
%>

<% session.setAttribute("page", "index"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="includes/html_head.jsp" %>
    <body>
        <%@include file="includes/templates/header.jsp" %>
        
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <h1>Bem-vindo ao Feici!</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur accumsan porttitor orci, in accumsan sapien egestas sit amet. 
                     Mauris blandit libero mauris. Nam in pharetra dui.</p>
                </div>
                <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <form class="form-horizontal" method="POST" action="users/signup" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="username" class="col-md-2 control-label label-login">Usuário:</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="username" placeholder="Entrar com usuário" autocomplete="off" pattern="[A-Z]{3,15}" title="Nomes de usuário devem conter de 3 a 15 letras maiúsculas e sem caracteres especiais. Ex: JOAO" required>
                            </div>
                        </div>
                        <input type="submit" value="Cadastrar" class="btn btn-primary col-md-6 col-md-offset-3 login-button"/>
                    </form>
                </div>    
                </div>
            </div>
        </div>            

        <div class="container">
            <div class="alert alert-danger hidden col-md-6 col-md-offset-3" role="alert">
                <p>Nome de usuário não disponível!</p>
            </div>
            
            <div class="alert alert-success hidden col-md-6 col-md-offset-3" role="alert">
                <p>Usuário cadastrado com sucesso!</p>
            </div>
        </div>
        <script>
            if ("signup-error" === "${signupstatus}") {
                requestError();
            } else if ("signup-success" === "${signupstatus}") {
                requestSuccess();
            }
        </script>
    </body>
</html>

<% session.setAttribute("signupstatus", "signup-hold"); %>