<%-- 
    Document   : feed
    Created on : Oct 13, 2016, 4:58:28 PM
    Author     : pedroreis
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="redesocial.Post"%>
<%@page import="redesocial.BaseDAO"%>
<%@page import="redesocial.DatabaseDAO"%>

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
                
                <form class="form-horizontal post-function" method="POST" action="user/post">
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-1">
                            <textarea class="form-control auto-expand" 
                                      name="post-content" rows="2" data-min-rows="2" 
                                      placeholder="Solte o verbo!" required></textarea>
                        </div>
                    </div>
                    <input type="submit" value="Postar" class="btn btn-success col-sm-3 col-sm-offset-8 post-button"/>
                </form>
            </div>
            <div class="user-feed col-sm-8">
                <% 
                    ArrayList<Post> timeLine = (new DatabaseDAO()).lerFeedDeNoticias((int) session.getAttribute("id"),0);
                    
                    for (int i = 0; i < timeLine.size(); i++) { %>
                    
                <div class="post col-sm-10 col-sm-offset-1">
                    <h3 class="post-author"><%= timeLine.get(i).getUsername() %></h3>
                    <h6 class="post-date"><%= timeLine.get(i).getDate() %></h6>
                    <div class="post-content">
                        <p><%= timeLine.get(i).getPost() %></p>
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
            <script>
                console.log("id", "<%= session.getAttribute("id") %>");
                console.log("username", "<%= session.getAttribute("username") %>");
            </script>
        </div>
    </body>
</html>
