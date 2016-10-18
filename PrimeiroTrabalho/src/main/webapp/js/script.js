/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// Auto expandable textarea solution from http://codepen.io/vsync/pen/frudD
// Code by: Yair Even Or (http://codepen.io/vsync/)

$(document)
        .one('focus.textarea', '.auto-expand', function () {
            var savedValue = this.value;
            this.value = '';
            this.baseScrollHeight = this.scrollHeight;
            this.value = savedValue;
        })
        .on('input.textarea', '.auto-expand', function () {
            var minRows = this.getAttribute('data-min-rows') | 0,
                rows;
            this.rows = minRows;
            rows = Math.ceil((this.scrollHeight - this.baseScrollHeight) / 17);
            this.rows = minRows + rows;
        });
        

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

function loginError() {
    $("div.alert-danger").fadeIn().removeClass("hidden");
    setTimeout(function() {
        $("div.alert-danger").fadeOut("hidden");
    }, 2000);
}

