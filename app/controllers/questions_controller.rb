get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  if logged_in?
    erb :'/questions/new'
  else
    redirect '/questions'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end

post '/questions' do
  question = Question.new(
    user_id: session[:user_id],
    title: params[:title],
    body: params[:body]
    # tags: params[:tags]
    )
  if question.save
    redirect '/questions'
  else
    question.errors.full_messages
    erb :'/questions/new'
  end
end
