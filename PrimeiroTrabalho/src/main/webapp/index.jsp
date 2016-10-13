<%-- 
    Document   : index
    Created on : Oct 13, 2016, 1:02:14 PM
    Author     : pedroreis
--%>
<%
    // Redirects to the news feed if user is already logged
    
    if (session.getAttribute("username") != null && !session.getAttribute("username").equals("")) {
        response.sendRedirect("feed.jsp");
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
    </head>
    <body>
        <div class="container-fluid header">
            <div class="custom-nav">
                <ul class="header-navigation">
                    <li><a href="index.jsp">Feici</a></li>
                    <li><a href="login.jsp">Login</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <div class="jumbotron">
                <h1>Bem-vindo ao Feici!</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur accumsan porttitor orci, in accumsan sapien egestas sit amet. Mauris blandit libero mauris. Nam in pharetra dui. Nunc magna turpis, ornare eget vehicula nec, facilisis at metus. Suspendisse orci elit, accumsan a justo non, condimentum blandit arcu. In et blandit dolor. Donec cursus purus tincidunt ultricies feugiat. Sed mollis risus blandit, porta nisi vel, molestie mi. In arcu eros, finibus eu nibh ut, vulputate semper eros. In hac habitasse platea dictumst. Etiam nec semper risus. Proin sed condimentum nunc, non dignissim mi.</p>
                <p>Phasellus odio lectus, dictum sit amet laoreet molestie, dictum eget quam. Mauris id fermentum sapien. Ut ut nibh et purus tristique efficitur nec et sem. Donec ultricies diam in purus feugiat pulvinar. Nunc mauris mi, consequat at mi vel, tincidunt consectetur nisl. Vivamus vitae laoreet sem. Vivamus sed placerat nisl. Morbi quis urna ac mi rutrum consectetur. Fusce a purus sit amet ipsum porta mattis ut non mauris. Suspendisse placerat, risus nec lacinia tincidunt, neque est lacinia sem, tristique consequat eros ante euismod augue. Integer auctor nibh quis neque laoreet, vitae semper tortor rhoncus. Nam sem magna, facilisis non laoreet vitae, convallis ut nibh. Maecenas lacus velit, hendrerit in tempus a, malesuada in risus.</p>
                <p><a class="btn btn-primary btn-lg" href="login.jsp" role="button">Cadastre-se</a></p>
            </div>
        </div>
    </body>
</html>