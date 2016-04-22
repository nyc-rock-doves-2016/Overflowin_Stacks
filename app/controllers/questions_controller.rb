get '/questions' do
  @questions = Question.order(updated_at: :desc)
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
    )
    tag_array = []
    tag_array = params[:tags].split(',')
    tag_array.each do |tag|
      new_tag = Tag.find_or_create_by(name: tag.strip)
      question.tags << new_tag
    end
  if question.save
    redirect '/questions'
  else
    question.errors.full_messages
    erb :'/questions/new'
  end
end
