get '/questions/:question_id/comments/new' do
  question = Question.find_by(id: params[:question_id])
  if request.xhr?
    erb :'/comments/_question_comment_partial', layout: false, locals: {question: question}
  else
    erb :'/questions/show'
    redirect '/questions/#{question.id}/comments/new'

  end 
end

get '/answers/:answer_id/comments/new' do
  answer = Answer.find_by(id: params[:answer_id])
  if request.xhr?
    erb :'/comments/_answer_comment_partial', layout: false, locals: {answer: answer}
  else
  erb :'/comments/_answer_comment_partial'
  redirect '/answers/#{answer.id}/comments/new'
end

post '/questions/:id/comments' do
  comment = Comment.new(params[:comment])
  if comment.save
    erb :'/questions/show'
  else
    @errors = ["Missing title or body"]
    erb :'/comments/_question_comment_partial'
  end
end

post '/answers/:id/comments' do
  comment = Comment.new(params[:comment])
  if comment.save
    erb :'/questions/show'
  else
    @errors = ["Missing title or body"]
    erb :'/comments/_answer_comment_partial'
  end
end