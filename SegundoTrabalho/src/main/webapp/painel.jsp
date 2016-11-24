<%-- 
    Document   : dashboard
    Created on : Nov 6, 2016, 2:24:57 PM
    Author     : pedroreis
--%>

<%

    // Redirects to the login page if user isn't already logged
    
    if (session.getAttribute("id") == null || session.getAttribute("id").toString().equals("0")) {
        response.sendRedirect("login.jsp");
    }
    
%>

<% session.setAttribute("page", "painel"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="includes/html_head.jsp" %>
    <body>
        <div class="container-fluid header">
            <div class="custom-nav">
                <ul class="header-navigation">
                    <li><a href="index.jsp">Feici</a></li>
                    <li><a href="user/logout">Logout</a></li>
                    <li class="header-items hidden" id="header-timeline"><p>Linha do Tempo</p></li>
                    <li class="header-items hidden" id="header-feed"><p>Feed</p></li>
                </ul>
            </div>
        </div>
        
        <div class="page hidden" id="feed">
            <div class="container main-content">
                <div class="user-info col-md-4">
                    <h4 class="user-firstname col-md-offset-1">${username}</h4>

                    <form class="form-horizontal post-function" method="POST" action="user/post" accept-charset="UTF-8">
                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <textarea id="feed-post-area" class="form-control auto-expand" 
                                          name="post-content" rows="2" data-min-rows="2" 
                                          placeholder="No que você está pensando?" required></textarea>
                            </div>
                        </div>
                        <input id="feed-post-btn" type="submit" value="Postar" class="btn btn-success col-md-4 col-md-offset-7 post-button"/>
                    </form>
                    
                    <div class="col-md-offset-1 col-md-10 row find-friends">
                        <h5>Encontre amigos</h5>
                        <input id="find-friends" class="form-control" type="text" placeholder="Procure amigos" />
                        <div id="friend-query-results">
                            
                        </div>
                    </div>
                </div>
                <div class="user-feed col-md-8">
                    
                </div>
                <div class="col-md-8 col-md-offset-4">
                    <button class="btn btn-info col-md-10 col-md-offset-1" id="get-more-feed">Ver posts mais antigos</button>
                </div>
            </div>
        </div>
        
        <div class="page hidden" id="timeline">
            <div class="container main-content">
                <div class="user-info col-md-8 col-md-offset-2">
                    <h4 class="user-firstname col-md-offset-1">${username}</h4>

                    <form class="form-horizontal post-function" method="POST" action="user/post" accept-charset="UTF-8">
                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <textarea id="timeline-post-area" class="form-control auto-expand" 
                                          name="post-content" rows="2" data-min-rows="2" 
                                          placeholder="No que você está pensando?" required></textarea>
                            </div>
                        </div>
                        <input id="timeline-post-btn" type="submit" value="Postar" class="btn btn-success col-md-4 col-md-offset-7 post-button"/>
                    </form>
                </div>
                <div class="user-timeline col-md-8 col-md-offset-2">
                    
                </div>
                <div class="col-md-8 col-md-offset-2">
                    <button class="btn btn-info col-md-10 col-md-offset-1" id="get-more-timeline">Ver posts mais antigos</button>
                </div>
            </div>
        </div>
        <script src="js/feici.js"></script>
        <script>
            feici.loadPosts('feed');
        </script>
    </body>
</html>
