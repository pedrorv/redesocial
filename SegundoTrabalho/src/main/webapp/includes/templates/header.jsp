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
                
                if ((!session.getAttribute("page").toString().equals("login")) &&
                     (session.getAttribute("id") == null || session.getAttribute("id").toString().equals("0"))) { %>
            
            <li><a href="login.jsp">Login</a></li>
            
            <% } 
                // Returns logout option if user is logged
                
                if (session.getAttribute("id") != null && !session.getAttribute("id").toString().equals("0")) { %>
            
            <li><a href="user/logout">Logout</a></li>
            
            <% } 
                // Returns timeline option if user is logged and on feed page
                
                if ( session.getAttribute("id") != null && !session.getAttribute("id").toString().equals("0") ) { %>
            
            <li><a href="timeline.jsp">Linha do Tempo</a></li>
            
            <% } 
                // Returns feed option if user is logged and on timeline page
                
                if ( session.getAttribute("id") != null && !session.getAttribute("id").toString().equals("0") ) { %>
            
            <li><a href="feed.jsp">Feed</a></li>
            
            <% } %>
            <% 
                // Both Feed and Timeline options will be showed on other pages (like the error one) if user is logged
            %>
        </ul>
    </div>
</div>