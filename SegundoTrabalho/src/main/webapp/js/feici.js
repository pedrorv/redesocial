/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Feici () {
    // Page loaders
    
    this.showPage = function(page, nav) {
        $('.page').addClass('hidden');
        $('.header-items').addClass('hidden');
        $('#header-' + nav).removeClass('hidden');
        $('#' + page).removeClass('hidden');
    };
    
    // Buttons events
    
    $("#header-timeline").on("click", function() {
        this.loadPosts('timeline', 'feed'); 
    }.bind(this));
    
    $("#header-feed").on("click", function() {
        this.loadPosts('feed', 'timeline'); 
    }.bind(this));
    
    $("#get-more-feed").on("click", function() {
        this.loadPosts('feed', 'timeline');
    }.bind(this));
    
    $("#get-more-timeline").on("click", function() {
        this.loadPosts('timeline', 'feed'); 
    }.bind(this));
    
    this.loadPosts = function (page, nav) {
        var postsDiv = $("div.user-" + page);
        var postsDivContent = postsDiv.html();
        var offset = postsDiv.find('div.post-' + page).length;
        var offsetParameter = "?offset=" + offset;
                
        $("#get-more-" + page).html("Buscando posts...");
        
        $.ajax({
            url: '/users/' + page + offsetParameter,
            dataType: 'text',
            cache: false
        }).done(function (data) {
            var posts = JSON.parse(data);
            postsDiv.html("");
            
            posts.forEach(function(post, index) {
                var postElement = '<div class="post post-' + page + ' col-md-10 col-md-offset-1">' +
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
            
            $("#get-more-" + page).html("Ver posts mais antigos");
            
            if ($("div#" + page).hasClass('hidden')) {
                this.showPage(page, nav);
            }
        }.bind(this));    
    };
}

var feici = new Feici();
    