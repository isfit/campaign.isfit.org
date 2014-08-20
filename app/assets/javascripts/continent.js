function onClickFunction(listItem) {
	console.log('jo');
	console.log(listItem);
}


$(window).resize(function() {
  if ($(this).width() < 981) {
    //do something
  }
});



ready = function(){
	$('#map-continents').cssMap({
		'size' : 960,
		'onClick': function(e){
			onClickFunction(e);
      var link = e.children('a').attr('href'),        // get link's URL; => #europe; 
          text = e.children('a').eq(0).text(),       // get text of the link; => Europe; 
          className = e.attr('class').split(' ')[0];  // get class name of the list item; => c4; 
      console.log(link);

     	if (link === '#africa') {
     		console.log('lol');
     		window.location= "http://no.wikipedia.org/wiki/Ebola_(virus)";
     	}
     }
   });
}

$(document).ready(ready);
$(document).on('page:load', ready);