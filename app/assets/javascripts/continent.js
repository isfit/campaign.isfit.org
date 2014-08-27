function onClickFunction(listItem) {


}


$(window).resize(function() {
  if ($(this).width() < 981) {
    //do something
  }
});



ready = function(){
	$('#map-continents').cssMap({
		'size' : 750,
		'onClick': function(e){
			onClickFunction(e);
      var link = e.children('a').attr('href'),        // get link's URL; => #europe; 
          text = e.children('a').eq(0).text(),       // get text of the link; => Europe; 
          className = e.attr('class').split(' ')[0];  // get class name of the list item; => c4; 
      console.log(link);

     	if (link === '#africa') {
        window.location= '/continents/1';
     	}
      if (link === '#asia') {
        window.location= '/continents/2';
      }
      if (link === '#australia') {
        window.location= '/continents/3';
      }
      if (link === '#europe') {
        window.location= '/continents/4';
      }
      if (link === '#north-america') {
        window.location= '/continents/5';
      }
      if (link === '#south-america') {
        window.location= '/continents/6';
      }
     }
   });
}

$(document).ready(ready);
$(document).on('page:load', ready);