/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {  
    // Prevent redirect until like, comment and share functions are implemented

    // $("ul.user-actions li a").on("click", function(e) {
    //     e.preventDefault();
    // });

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

function newPostAlert() {
    $("div.alert-info").fadeIn().removeClass("hidden");
}

// Convert URLs to links

function convertLinks(text) {
    var textArr = text.split("\n");
    textArr.forEach(function(line, index1) {
        var textLine = line.split(" ");
        textLine.forEach(function(item, index2) {
            if (IsURL(item.toLowerCase())) {
                var test2 = "http://" + item.toLowerCase();
                if (isValid(test2)) {   
                    var string = "<a href='" + test2 + "'>" + item + "</a>";
                    textLine[index2] = string;
                }
            }
        });
        textArr[index1] = textLine.join(" ");;
    });
    return textArr.join("\n");
}