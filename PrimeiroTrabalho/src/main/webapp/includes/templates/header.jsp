<%-- 
    Document   : header
    Created on : Oct 14, 2016, 12:15:31 PM
    Author     : pedroreis
--%>
<% // Header template for each page %>

<div class="container-fluid header">
    <div class="custom-nav">
        <ul class="header-navigation">
            <li><a href="index.jsp">Feici</a></li>
            <% 
                // Returns login option if user isn't logged and isn't in login page
                
                if ((request.getRequestURI().equals("/") ||
                     request.getRequestURI().equals("/index.jsp")) &&
                    !request.getRequestURI().equals("/login.jsp"))  {%>
            
            <li><a href="login.jsp">Login</a></li>
            
            <% } 
                // Returns logout option if user is logged
                
                if (!request.getRequestURI().equals("/login.jsp") &&
                    !request.getRequestURI().equals("/index.jsp") &&
                    !request.getRequestURI().equals("/")) { %>
            
            <li><a href="user/logout">Logout</a></li>
            
            <% } 
                // Returns timeline option if user is logged and on feed page
                
                if (request.getRequestURI().equals("/feed.jsp")) { %>
            
            <li><a href="timeline.jsp">Linha do Tempo</a></li>
            
            <% } 
                // Returns feed option if user is logged and on timeline page
                
                if (request.getRequestURI().equals("/timeline.jsp")) { %>
            
            <li><a href="feed.jsp">Feed</a></li>
            
            <% } %>
        </ul>
    </div>
</div>