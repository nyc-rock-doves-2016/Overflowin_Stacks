$(document).ready(function() {
	$('.new-answer-link').on('click', function(event){
		event.preventDefault();
			var $target = $(event.target)
			$.ajax({
				url: $target.attr('href')
			}).done(function(response){
				$('#new-answer-container').html(response);
			}).fail(function(error){
				console.log("ERROR")
			});
		});

		$('#new-answer-container').on('submit','#new-answer-form', function(event){
			event.preventDefault();
			var $target = $(event.target)

			$.ajax({
				url: $target.attr('action'),
				method: $target.attr('method'),
				data: $target.serialize()
			}).done(function(response){
				$('.answers-list').append(response);
				// console.log("i'm the response yay", response);
				$('#new-answer-container').html($('.new-answer-link'));
			// then use jquery to rip out old element in dom and relace with new response element
			}).fail(function(error){
				console.log("there was an ERROR");
		});
	});

});
