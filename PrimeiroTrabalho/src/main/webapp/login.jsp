<%-- 
    Document   : login
    Created on : Oct 13, 2016, 5:36:46 PM
    Author     : pedroreis
--%>

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
    </head>
    <body>
        <div class="container-fluid header">
            <div class="custom-nav">
                <ul class="header-navigation">
                    <li><a href="index.jsp">Feici</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <div class="main-login col-sm-6 col-sm-offset-3">
                <form class="form-horizontal" method="GET" action="handleLogin">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label label-login">Usuário:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="username" placeholder="Entrar com usuário" autofocus>
                        </div>
                    </div>
                    <input type="submit" value="Logar" class="btn btn-primary col-sm-6 col-sm-offset-3"/>
                </form>
            </div>
        </div>
    </body>
</html>
