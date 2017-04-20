<%-- 
    Document   : index
    Created on : Oct 13, 2016, 1:02:14 PM
    Author     : pedroreis
--%>
<%
    
    // Redirects to the news feed if user is already logged
    
    if (session.getAttribute("id") != null && !session.getAttribute("id").toString().equals("0")) {
        response.sendRedirect("feed.jsp");
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
                <h1>Bem-vindo ao Feici!</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur accumsan porttitor orci, in accumsan sapien egestas sit amet. Mauris blandit libero mauris. Nam in pharetra dui. Nunc magna turpis, ornare eget vehicula nec, facilisis at metus. Suspendisse orci elit, accumsan a justo non, condimentum blandit arcu. In et blandit dolor. Donec cursus purus tincidunt ultricies feugiat. Sed mollis risus blandit, porta nisi vel, molestie mi. In arcu eros, finibus eu nibh ut, vulputate semper eros. In hac habitasse platea dictumst. Etiam nec semper risus. Proin sed condimentum nunc, non dignissim mi.</p>
                <p><a class="btn btn-primary btn-lg" href="login.jsp" role="button">Cadastre-se</a></p>
            </div>
        </div>
    </body>
</html>