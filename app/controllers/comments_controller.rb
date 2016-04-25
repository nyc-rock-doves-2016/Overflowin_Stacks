get '/questions/:question_id/comments/new' do
  @question = Question.find_by(id: params[:question_id])

  #ZM: Why are you rendinger a partial if it's not an xhr request?
  #ZM: If you do this then you can minimalize this line like this.

  #ZM :erb '/comments/questions', layout: !!request.xhr?, locals:{question: @question}

  if request.xhr?
    erb :'/comments/_question_comment_partial', layout: false, locals: {question: @question}
  else
    erb :'/comments/_question_comment_partial'
  end
end

get '/answers/:answer_id/comments/new' do
  @answer = Answer.find_by(id: params[:answer_id])
  if request.xhr?
    erb :'/comments/_answer_comment_partial', layout: false, locals: {answer: @answer}
  else
  erb :'/comments/_answer_comment_partial'

  end
end

post '/questions/:id/comments' do
  comment = Comment.new(params[:comment])
  if request.xhr?
    if comment.save
      erb :'/comments/_comment_partial', layout: false, locals: {comment: comment}
  else
    @errors = ["Missing title or body"]
    erb :'/comments/_question_comment_partial'
  end
end
end

post '/answers/:id/comments' do
  comment = Comment.new(params[:comment])
  if comment.save

    redirect "/questions/#{comment.commentable.question_id}"
  else
    @errors = ["Missing title or body"]
    erb :'/comments/_answer_comment_partial'
    end
end
