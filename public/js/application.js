$(document).ready(function() {
	$('.new-answer-link').on('click', function(event){
		event.preventDefault();
		var $target = $(event.target)
		$.ajax({
			url: $target.attr('href'),
			method: $target.attr('method')
		}).done(function(response){
			$('.new-answer').html(response);
		}).fail(function(error){
			console.log("ERROR")
		});
	});
	$('.new-answer').on('submit','#new-answer-form', function(event){
		event.preventDefault();
		console.log('we cool?')
		var $target = $(event.target)
		debugger;
		$.ajax({
			url: $target.attr('action'),
			method: $target.attr('method'),
			data: $target.serialize()
		}).done(function(response){
			console.log("i'm the response yay", response);
			debugger;
			// then use jquery to rip out old element in dom and relace with new response element
		}).fail(function(error){
			console.log("there was an ERROR");
		});
	});
});
