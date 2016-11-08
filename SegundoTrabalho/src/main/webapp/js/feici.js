/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Feici () {
    var self = this;

    // Page loaders
       
    this.loadFeed = function () {
      $('.page').addClass('hidden');
      $('.header-items').addClass('hidden');
      $('#header-timeline').removeClass('hidden');
      $('#feed').removeClass('hidden');
    };
    
    this.loadTimeline = function () {
      $('.page').addClass('hidden');
      $('.header-items').addClass('hidden');
      $('#header-feed').removeClass('hidden');
      $('#timeline').removeClass('hidden');
    };
    
    // Buttons events
    
    $("#header-timeline").on("click", function() {
        self.showTimeline(); 
    });
    
    $("#header-feed").on("click", function() {
        self.showFeed(); 
    });
    
    $("#get-more-feed").on("click", function() {
        self.showFeed(); 
    });
    
    $("#get-more-timeline").on("click", function() {
        self.showTimeline(); 
    });
    
    this.showFeed = function() {
        var postsDiv = $("div.user-feed");
        var postsDivContent = postsDiv.html();
        var offset = postsDiv.find('div.post-feed').length;
        var offsetParameter = "?offset=" + offset;
                
        $("#get-more-feed").html("Buscando posts...");
        
        $.ajax({
            url: '/users/feed' + offsetParameter,
            dataType: 'text',
            cache: false
        }).done(function (data) {
            var posts = JSON.parse(data);
            postsDiv.html("");
            
            posts.forEach(function(post, index) {
                var postElement = '<div class="post post-feed col-md-10 col-md-offset-1">' +
                                    '<h3 class="post-author">' + post.username + '</h3>' +
                                    '<h6 class="post-date">' + post.date + '</h6>' +
                                    '<div class="post-content">' + 
                                        '<pre>' + post.post + '</pre>' +
                                    '</div>' + 
                                    '<div class="post-actions">' +
                                        '<ul class="user-actions">' + 
                                            '<li><a href="user/like">Curtir</a></li>' + 
                                            '<li><a href="user/comment">Comentar</a></li>' + 
                                            '<li><a href="user/share">Compartilhar</a></li>' +
                                        '</ul>' +
                                    '</div>' + 
                                '</div>';
                        
                postsDiv.append(postElement);                           
            });
            
            convertLinks();
            postsDiv.prepend(postsDivContent);
            
            $("#get-more-feed").html("Ver posts mais antigos");
            
            if ($("div#feed").hasClass('hidden')) {
                self.loadFeed();
            }
        });
    };
    
    this.showTimeline = function(shouldOffset) {
        var postsDiv = $("div.user-timeline");
        var postsDivContent = postsDiv.html();
        var offset = postsDiv.find('div.post-timeline').length;
        var offsetParameter = "?offset=" + offset;
        
        $("#get-more-timeline").html("Buscando posts...");
        
        $.ajax({
            url: '/users/timeline' + offsetParameter,
            dataType: 'text',
            cache: false
        }).done(function (data) {
            var posts = JSON.parse(data);
            postsDiv.html("");
            
            posts.forEach(function(post, index) {      
                var postElement = '<div class="post post-timeline col-md-10 col-md-offset-1">' +
                                    '<h3 class="post-author">' + post.username + '</h3>' +
                                    '<h6 class="post-date">' + post.date + '</h6>' +
                                    '<div class="post-content">' + 
                                        '<pre>' + post.post + '</pre>' +
                                    '</div>' + 
                                    '<div class="post-actions">' +
                                        '<ul class="user-actions">' + 
                                            '<li><a href="user/like">Curtir</a></li>' + 
                                            '<li><a href="user/comment">Comentar</a></li>' + 
                                            '<li><a href="user/share">Compartilhar</a></li>' +
                                        '</ul>' +
                                    '</div>' + 
                                '</div>';
                        
                postsDiv.append(postElement);                           
            });
            
            convertLinks();
            postsDiv.prepend(postsDivContent);
            
            $("#get-more-timeline").html("Ver posts mais antigos");
            
            if ($("div#timeline").hasClass('hidden')) {
                self.loadTimeline();
            }
        });
    };
}

var feici = new Feici();
    