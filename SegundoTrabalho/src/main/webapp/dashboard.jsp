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

<% session.setAttribute("page", "dashboard"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid header">
            <div class="custom-nav">
                <ul class="header-navigation">
                    <li><a href="index.jsp">Feici</a></li>
                    <li class="header-items hidden" id="header-logout"><a href="user/logout">Logout</a></li>
                    <li class="header-items hidden" id="header-timeline"><a href="timeline.jsp">Linha do Tempo</a></li>
                    <li class="header-items hidden" id="header-feed"><a href="feed.jsp">Feed</a></li>
                </ul>
            </div>
        </div>
        
        <div class="page hidden" id="feed">
            <div class="container main-content">
                <div class="user-info col-sm-4">
                    <h4 class="user-firstname col-sm-offset-1">${username}</h4>

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
                <div class="user-feed col-sm-8">
                    
                </div>
            </div>
        </div>
        
        <div class="page hidden" id="timeline">
            <div class="container main-content">
                <div class="user-info col-sm-8 col-sm-offset-2">
                    <h4 class="user-firstname col-sm-offset-1">${username}</h4>

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
                    
                </div>
            </div>
        </div>
                    
        <script src="js/feici.js"></script>
        <script>
            feici.loadFeed();
        </script>
    </body>
</html>
