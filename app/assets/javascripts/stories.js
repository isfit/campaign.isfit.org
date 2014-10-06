var ready;
ready = function() {
    $.getJSON("http://graph.facebook.com/?id=" + window.location.href, function (json){
        if(typeof json.shares === 'undefined'){
          $('#fb-counter1').text(0);
          $('#fb-counter2').text(0);
        }
        else{
          $('#fb-counter1').text(json.shares);
          $('#fb-counter2').text(json.shares);
        }
    });
    $.getJSON("http://graph.facebook.com/?id=http://www.theglobalinfection.com", function (json){
        if(typeof json.shares === 'undefined'){
          $('#fb-counter-footer').text(0);
        }
        else{
          $('#fb-counter-footer').text(json.shares);
        }
    });
    function getTwitterCount(url) {
        $.ajax({
            method: "GET",
            url: url,
            dataType: "jsonp",
            jsonp: "callback",
            success: function (json) {
                if(typeof json.count === 'undefined'){
                    $('#twitter-counter1').text(0);
                }
                else{
                    $('#twitter-counter1').text(json.count);
                }
            }
        });
    }
    function getTwitterCountFooter(url) {
        $.ajax({
            method: "GET",
            url: url,
            dataType: "jsonp",
            jsonp: "callback",
            success: function (json) {
                if(typeof json.count === 'undefined'){
                    $('#twitter-counter-footer').text(0);
                }
                else{
                    $('#twitter-counter-footer').text(json.count);
                }
            }
        });
    }

    getTwitterCount("http://urls.api.twitter.com/1/urls/count.json?url=" + window.location.href);
    getTwitterCountFooter("http://urls.api.twitter.com/1/urls/count.json?url=http://www.theglobalinfection.com");


    
};
$(document).ready(ready);
$(document).on('page:load', ready);