<%-- 
    Document   : feed
    Created on : Oct 13, 2016, 4:58:28 PM
    Author     : pedroreis
--%>
<%
    
    // Redirects to the login page if user isn't already logged
    
    if (session.getAttribute("username") == null || session.getAttribute("username").toString() == "") {
        response.sendRedirect("login.jsp");
    }
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="includes/html_head.jsp" %>
    <body>
        <%@include file="includes/templates/header.jsp" %>
        <div class="container main-content">
            <div class="user-info col-sm-4">
                <h4 class="user-firstname col-sm-offset-1"> ${username} </h4>
                
                <form class="form-horizontal" method="POST" action="user/post">
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-1">
                            <textarea class="form-control auto-expand" 
                                      name="post-content" rows="2" data-min-rows="2" 
                                      placeholder="Solte o verbo!" required></textarea>
                        </div>
                    </div>
                    <input type="submit" value="Postar" class="btn btn-primary col-sm-3 col-sm-offset-8 post-button"/>
                </form>
            </div>
            <div class="user-feed col-sm-8">
                <% for (int i = 0; i < 4; i++) { %>
                <div class="post col-sm-10 col-sm-offset-1">
                    <h3>Autor</h3>
                    <h6>Data</h6>
                    <div class="post-content">
                        <p>Conteúdo do post!</p>
                    </div>
                    <div class="post-actions">
                        <ul class="user-actions">
                            <li><a href="user/like">Curtir</a></li>
                            <li><a href="user/comment">Comentar</a></li>
                            <li><a href="user/share">Compartilhar</a></li>
                        </ul>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </body>
</html>
