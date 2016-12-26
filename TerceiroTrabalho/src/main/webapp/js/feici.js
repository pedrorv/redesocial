/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Feici (id) {
    var _this = this;
    var friendsTimer;
    var websocket;
    var loggedUser = id;
    var newPosts = 0;
    
    // Websocket
    
    function connect() {
        var wsUri = "ws://localhost:8080/newpostemitter";
        
        try {
            websocket = new WebSocket(wsUri);
        } catch (error) {
            return console.log('Erro:', error);
        }
        
        websocket.binaryType = "arraybuffer";

        websocket.onopen = function (event) {
            console.log('Conectou');            
        };

        websocket.onmessage = function (event) {
            var friends = JSON.parse(event.data);
            if (friends.indexOf(loggedUser) !== -1) {
                newPosts += 1;
                $('span#amount').html(newPosts);
                $('span#message').html((newPosts > 1) ? 'novas mensagens.' : 'nova mensagem.');
                newPostAlert();
            }            
        };

        websocket.onerror = function (event) {
            console.log('Erro:', event);            
        };
    }
    
    connect();    
    console.log(websocket);
    
    
    // Page loader
    
    var showPage = function(page, nav) {
        $('.page').addClass('hidden');
        $('.header-items').addClass('hidden');
        $('#header-' + nav).removeClass('hidden');
        $('#' + page).removeClass('hidden');
    };
    
    // Buttons events
    
    $("#header-timeline").on("click", function() {
        if ($("div.user-timeline").find('div.post-timeline').length > 0) {
            showPage('timeline', 'feed');
        } else {
            _this.loadPosts('timeline'); 
        }
    });
    
    $("#header-feed").on("click", function() {
        if ($("div.user-feed").find('div.post-feed').length > 0) {
            showPage("feed", "timeline");
        } else {
            _this.loadPosts("feed");
        }
    });
    
    $("div.new-post-alert").on("click", function() {
       _this.loadPosts("feed", "new", newPosts);
       $("div.new-post-alert").addClass("hidden");
       newPosts = 0;
    });
    
    $("#get-more-feed").on("click", function() {
        _this.loadPosts("feed");
    });
    
    $("#get-more-timeline").on("click", function() {
        _this.loadPosts("timeline"); 
    });
    
    $("input.post-button").on("click", function(e) {
        e.preventDefault();
        var id = e.target.id;
        var textID = (id === 'feed-post-btn') ? '#feed-post-area' : '#timeline-post-area';
        var page = (id === 'feed-post-btn') ? 'feed' : 'timeline';
        
        $.ajax({
            url: '/user/post',
            method: 'POST',
            dataType: 'text',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: $.param({ 'post-content': encodeURIComponent($(textID).val()) }),
            success: function (data) {
                var response = JSON.parse(data);
                if (response.error) {
                    window.location.href = '/error.jsp';
                } else {
                    _this.loadPosts(page, 'new');
                    websocket.send(loggedUser);
                }
            }
        });
        
        $(textID).val('');
        $(textID).attr('rows', 2);
    });
    
    $("input#find-friends").on("input", function(e) {
        clearTimeout(friendsTimer);
       
        var searchString = $(this).val().toUpperCase();
        $("#friend-query-results").html('');
       
        if (searchString.length > 0) {
            friendsTimer = setTimeout(function() {
                $.ajax({
                url: '/user/findfriends',
                method: 'GET',
                dataType: 'text',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                data: $.param({ 'search': encodeURIComponent(searchString) }),
                success: function (data) {
                    var response = JSON.parse(data);
                    if (response.error) {
                        window.location.href = '/error.jsp';
                    } else {
                            response.forEach(function(friend) {
                                var friendElement = '<div class="col-md-12 friend-result">' + 
                                                        '<h5 class="friend-name">' + friend + '</h5>' +
                                                    '</div>';


                                $("#friend-query-results").append(friendElement);
                            });
                        }
                    }
                });
            }, 300);
        }
       
    });
    
    // Posts loader
    
    this.loadPosts = function (page, from, limit) {
        var postsDiv = $("div.user-" + page);        
        var offset = (from === 'new') ? 0 : postsDiv.find('div.post-' + page).length;
        var offsetParameter = "?offset=" + offset;
        var limitParameter = offsetParameter + "&limit=" + (limit || 10);
        var nav = (page === 'feed') ? 'timeline' : 'feed';
                
        $("#get-more-" + page).html("Buscando posts...");
        
        $.ajax({
            url: '/user/' + page + limitParameter,
            dataType: 'text',
            method: 'POST',
            success: function (data) {
                var posts = JSON.parse(data);
                if (posts.error) {
                    window.location.href = '/error.jsp';
                } else {
                    
                    // Reverse the order if new post
                    if (offset === 0) {
                        posts = posts.reverse();
                    }
                    posts.forEach(function(post, index) {
                        
                        // Only insert a new post
                        if ($("div.user-" + page).find("div#post-" + page + '-' + post.id).length === 0) {
                            var postElement =   '<div id="post-' + page + '-' + post.id + '" class="post post-' + page + ' col-md-10 col-md-offset-1">' +
                                                '<h3 class="post-author">' + post.username + '</h3>' +
                                                '<h6 class="post-date">' + post.date + '</h6>' +
                                                '<div class="post-content">' + 
                                                    '<pre>' + convertLinks(decodeURIComponent(post.post)) + '</pre>' +
                                                '</div>' + 
                                                '<div class="post-actions">' +
                                                    '<ul class="user-actions">' + 
                                                        '<li><a href="user/like">Curtir</a></li>' + 
                                                        '<li><a href="user/comment">Comentar</a></li>' + 
                                                        '<li><a href="user/share">Compartilhar</a></li>' +
                                                    '</ul>' +
                                                '</div>' + 
                                            '</div>';

                            // Insert the post after the ones in the page if old and before if new
                            if (offset === 0) {
                                postsDiv.prepend(postElement);
                            } else {
                                postsDiv.append(postElement);
                            }
                        }
                    });

                    $("#get-more-" + page).html("Ver posts mais antigos");

                    if ($("div#" + page).hasClass('hidden')) {
                        showPage(page, nav);
                    }
                    
                    // Insert event to prevent liking, sharing and commenting functionalities until not implemented.
                    
                    $("ul.user-actions li a").on("click", function(e) {
                        e.preventDefault();
                    });
                }
            }
        });
        
    };
}
    