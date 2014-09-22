

function getInstagram(url) {
    $.ajax({
        method: "GET",
        url: url,
        dataType: "jsonp",
        jsonp: "callback",
        success: function (data) {
            var output = "";
            var div = document.getElementById('instagram-div');
            $.each(data.data, function (i, item) {
                output += '<div class="col-md-2 bottom-margin"><a href="' + item.link +'"><img src="' + item.images.standard_resolution.url + '" class="instagram_image"/></a></div>';

            });
            div.innerHTML = output;
        }
    });
}
var ready;
ready = function() {
  getInstagram('https://api.instagram.com/v1/tags/nofilter/media/recent?client_id=802d634befd6476c80cc18dbee1ce8e0&count=6');
        //getInstagram('https://api.instagram.com/v1/tags/isfit2015/media/recent?client_id=802d634befd6476c80cc18dbee1ce8e0&count=2');
};

$(document).ready(ready);
$(document).on('page:load', ready);