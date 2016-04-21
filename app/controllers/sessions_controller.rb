get '/login' do
	erb :'/sessions/new'
end

post '/login' do
	user = User.find_by(username: params[:username])

	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		errors = ['Invalid Username or Password']
		erb :'/sessions/new'
	end
end

delete '/logout' do
	session.clear
	redirect '/questions'
end

