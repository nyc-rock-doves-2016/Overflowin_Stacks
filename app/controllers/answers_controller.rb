get '/answers/new' do
	erb :'answers/new'
end

post '/answers' do
	answer = Answer.new(params[:answer])
	if answer.save
		redirect '/answers'
	else
		erb :'answers/new'
	end
end

get '/answers/:id/edit' do
	@answer = Answer.find(params[:id])
	erb :'answers/edit'
end

put '/asnwers/:id' do
	@answer = Answer.find(params[:id])
	@answer.update_attributes(params[:answer])
	if @answer.save
		redirect '/questions/:id'
	else
		erb :'answers/edit'
	end
end

delete '/answers/:id' do
	@answer = Answer.find(params[:id])
	@answer.destroy
	redirect '/questions/:id'
end
