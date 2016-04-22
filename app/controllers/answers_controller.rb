get '/questions/:question_id/answers/new' do
	@question = Question.find(params[:question_id])
	if request.xhr?
		erb :'answers/_new', layout: false, locals: {question: @question}
	else
		erb :'answers/new'
	end
end

post '/questions/:question_id/answers' do
	question = Question.find(params[:question_id])
	answer = question.answers.new(body: params[:body], question_id: params[:question_id], user_id: session[:user_id])
	if answer.save
		if request.xhr?
			erb :'answers/_new', layout: false, locals: {answer: answer, question: question}
		else
			redirect "/questions/#{question.id}/answers"
		end
	else
		erb :'answers/new', locals: {answer: answer, question: question}
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

delete '/questions/:question_id/answers/:id' do
	@question = Question.find(params[:question_id])
	@answer = @question.answers.find(params[:id])
	@answer.destroy
	redirect "/questions/#{@question.id}/answers"
end
