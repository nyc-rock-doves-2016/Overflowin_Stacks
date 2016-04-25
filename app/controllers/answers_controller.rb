get '/questions/:question_id/answers/new' do
	@question = Question.find(params[:question_id])
	if request.xhr?
		erb :'/answers/_answer_form_partial', layout: false
	else
		# erb :'answers/_new'
		redirect "/"
	end
end

post '/questions/:question_id/answers' do
	@answer = Answer.new(
		body: params[:body],
		question_id: params[:question_id],
		user_id: session[:user_id])

		#ZM: let's reduce some nesting by doing something like this.
		# redirect "/ unless @answer.save"
		# if request.xhr? 
		#  do foo
		# else 
		#  do bar
		# end
		if @answer.save
			if request.xhr?
				erb :'/answers/_new_answer_partial', layout: false, locals: {answer: @answer}
			else
				redirect "/questions/#{answer.question.id}"
			end
		else
			redirect "/"
		end
end

get '/questions/:question_id/answers/:id/edit' do
	@question = Question.find(params[:question_id])
	@answer = @question.answers.find(params[:id])
	erb :'answers/edit'
end

put '/questions/:question_id/asnwers/:id' do
	@question = Question.find(params[:question_id])
	@answer = @question.answers.find(params[:id])
	if @answer.update_attributes(params[:answer])
		redirect "/questions/#{question.id}/answers"
	else
		erb :'answers/edit'
	end
end

post '/questions/:question_id/answers/:id' do
	@answer = Answer.find_by(id: params[:id])
	# if @answer.question.user_id == session[:user_id]
	#ZM: indentation issues

	#ZM: LOOK INTO update_all to update a group of records
	# instead of iterating though all of them.
	# # http://apidock.com/rails/ActiveRecord/Relation/update_all
		@answer.question.answers.each do |answer|
			answer.best_answer = false
			answer.save
		# end
		@answer.best_answer = true
		@answer.save
	end
	redirect "/questions/#{@answer.question.id}"
end

delete '/questions/:question_id/answers/:id' do
	@question = Question.find(params[:question_id])
	@answer = @question.answers.find(params[:id])
	@answer.destroy
	redirect "/questions/#{@question.id}/answers"
end
