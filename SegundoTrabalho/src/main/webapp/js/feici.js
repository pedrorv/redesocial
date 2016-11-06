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
    
    this.showFeed = function() {
        $.ajax({
            url: '/users/feed',
            dataType: 'text',
            cache: false
        }).done(function (data) {
            var posts = JSON.parse(data);
            var postsDiv = $("div.user-feed").html("");
            
            posts.forEach(function(post, index) {
                var postElement = '<div class="post col-sm-10 col-sm-offset-1">' +
                                    '<h3 class="post-author">' + post.username + '</h3>' +
                                    '<h6 class="post-date">' + post.date + '</h6>' +
                                    '<div class="post-content">' + 
                                        '<p>' + post.post + '</p>' +
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
            self.loadFeed();
        });
    };
    
    this.showTimeline = function() {
        $.ajax({
            url: '/users/timeline',
            dataType: 'text',
            cache: false
        }).done(function (data) {
            var posts = JSON.parse(data);
            var postsDiv = $("div.user-timeline").html("");
            
            posts.forEach(function(post, index) {      
                var postElement = '<div class="post col-sm-10 col-sm-offset-1">' +
                                    '<h3 class="post-author">' + post.username + '</h3>' +
                                    '<h6 class="post-date">' + post.date + '</h6>' +
                                    '<div class="post-content">' + 
                                        '<p>' + post.post + '</p>' +
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
            self.loadTimeline();
        });
    };
}

var feici = new Feici();
    