<%-- 
    Document   : index
    Created on : Oct 13, 2016, 1:02:14 PM
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
            <a href="index.jsp"><h1>Feici</h1></a>
        </div>
        <div class="container">
            <div class="main-login col-sm-6 col-sm-offset-3">
                <form class="form-horizontal" action="login">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label label-login">Usuário:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="username" placeholder="Entrar com usuário">
                        </div>
                    </div>
                    <input type="submit" value="Logar" class="btn btn-primary col-sm-6 col-sm-offset-3"/>
                </form>
            </div>
        </div>
    </body>
</html>
