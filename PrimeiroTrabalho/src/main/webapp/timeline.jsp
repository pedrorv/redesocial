<%-- 
    Document   : timeline.jsp
    Created on : Oct 14, 2016, 1:35:21 PM
    Author     : pedroreis
--%>
<%
    
    // Redirects to the login page if user isn't already logged
    
    if (session.getAttribute("username") == null || session.getAttribute("username").toString() == "") {
        response.sendRedirect("login.jsp");
    }
    
%>

<%@page import="java.util.ArrayList"%>
<%@page import="redesocial.Post"%>
<%@page import="redesocial.BaseDAO"%>
<%@page import="redesocial.DatabaseDAO"%>

<% session.setAttribute("page", "timeline"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="includes/html_head.jsp" %>
    <body>
        <%@include file="includes/templates/header.jsp" %>
        <div class="container main-content">
            <div class="user-info col-sm-8 col-sm-offset-2">
                <h4 class="user-firstname col-sm-offset-1"> ${username} </h4>
                
                <form class="form-horizontal post-function" method="POST" action="user/post" accept-charset="UTF-8">
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-1">
                            <textarea class="form-control auto-expand" 
                                      name="post-content" rows="2" data-min-rows="2" 
                                      placeholder="No que você está pensando?" required></textarea>
                        </div>
                    </div>
                    <input type="submit" value="Postar" class="btn btn-success col-sm-3 col-sm-offset-8 post-button"/>
                </form>
            </div>
            <div class="user-timeline col-sm-8 col-sm-offset-2">
                <% 
                    ArrayList<Post> timeline = (new DatabaseDAO()).getTimeline((int) session.getAttribute("id"),0);
                    
                    for (int i = 0; i < timeline.size(); i++) { %>
                    
                <div class="post col-sm-10 col-sm-offset-1">
                    <h3 class="post-author"><%= timeline.get(i).getUsername() %></h3>
                    <h6 class="post-date"><%= timeline.get(i).getDate() %></h6>
                    <div class="post-content">
                        <p><%= timeline.get(i).getPost() %></p>
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
        <script>
            $(document).ready(function() {
               convertLinks(); 
            });
        </script>
    </body>
</html>
