$(document).ready(function() {
	$('#new-answer-link').on('click', function(event){
		event.preventDefault();
			var $target = $(event.target)
			$.ajax({
				url: $target.attr('href')
			}).done(function(response){
				$('#new-answer-link').hide();
				$('#new-answer-container').append(response);
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
				$('#new-answer-form').remove();
				$('#new-answer-link').show();
			}).fail(function(error){
				console.log("there was an ERROR");
		});
	});

});
