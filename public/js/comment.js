$(document).ready(function() {
	$('.new-question-comment-link').on('click', function(event){
		event.preventDefault();

		var $target = $(event.target)

		$.ajax({
			url: $target.attr('href')
		}).done(function(response){
			$('#new-question-comment-container').html(response);
			$('.new-question-comment-link').hide();
		}).fail(function(error){
			console.log("ERROR")
		});
	});

	$('#new-question-comment-container').on('submit','#new-question-comment-form',function(event){
			event.preventDefault();

			var $target = $(event.target)

			$.ajax({
				url: $target.attr('action'),
				method: $target.attr('method'),
				data: $target.serialize()
			}).done(function(response){
				$('.question-comments').append(response);
				$('.new-question-comment-link').show();

				$('#new-question-comment-container').html($('.new-question-comment-link'));
			}).fail(function(error){
				console.log('there was an ERROR');
			});


		});
});

