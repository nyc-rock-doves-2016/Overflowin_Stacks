
get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find_by(params[:id])
  erb :'/questions/show'
end

post '/questions' do
  question = Question.new(
    user_id: session[:user_id],
    title: params[:title],
    body: params[:body])
  if question.save
    redirect '/questions'
  else
    erb :'/questions/new'
  end
end
