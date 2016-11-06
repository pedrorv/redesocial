/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Feici () {
    // Page loaders
    
    this.loadIndex = function () {
      $('.page').addClass('hidden');
      $('.header-items').addClass('hidden');
      $('#header-login').removeClass('hidden');
      $('#index').removeClass('hidden');
    };
    
    this.loadLogin = function () {
      $('.page').addClass('hidden');
      $('.header-items').addClass('hidden');
      $('#login').removeClass('hidden');
    };
    
    this.loadSignup = function () {
      $('.page').addClass('hidden');
      $('.header-items').addClass('hidden');
      $('#signup').removeClass('hidden');
      $('#header-login').removeClass('hidden');
    };
    
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
    
    this.loadError = function () {
      $('.page').addClass('hidden');
      $('.header-items').addClass('hidden');
      $('#header-feed').removeClass('hidden');
      $('#header-timeline').removeClass('hidden');
      $('#header-logout').removeClass('hidden');
      $('#error').removeClass('hidden');
    };
    
    // Buttons events
    
    /*this.showFeed = function() {;
        $.ajax({
            url: '/' + id,
            dataType: 'json',
            cache: false
        }).done(function (data) {
            d3.select('svg').remove()
            if ( id === "two" || id === "three" ) {
              $("pre#json").html(JSON.stringify(data, null, 2))
            } else {
              $("pre#json").html("")
              drawGraph(data)
            }
        })
    };*/
}

var feici = new Feici();
    