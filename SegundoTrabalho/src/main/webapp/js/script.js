/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {  
    // Prevent redirect until like, comment and share functions are implemented

    $("ul.user-actions li a").on("click", function(e) {
        e.preventDefault();
    });

    // Prevent redirect until post function is implemented

    //$("form.post-function").on("submit", function(e) {;
    //    e.preventDefault();
    //});
    
});

// Show user login error message

function requestError() {
    $("div.alert-danger").fadeIn().removeClass("hidden");
    setTimeout(function() {
        $("div.alert-danger").fadeOut("hidden");
    }, 2000);
}

function requestSuccess() {
    $("div.alert-success").fadeIn().removeClass("hidden");
    setTimeout(function() {
        $("div.alert-success").fadeOut("hidden");
    }, 2000);
}


// Convert URLs to links

function convertLinks() {
    $("div.post-content p").each(function() {
        var self = $(this);
        var text = self[0].textContent;
        var textArr = text.split(" ");
        textArr.forEach(function(item, index) {
           if (IsURL(item)) {
                var test2 = "http://" + item;
                if (isValid(test2)) {   
                    var string = "<a href='http://" + item + "'>" + item + "</a>";
                    textArr[index] = string;
                }
           }
        });
        self.html(textArr.join(" "));
    });
}