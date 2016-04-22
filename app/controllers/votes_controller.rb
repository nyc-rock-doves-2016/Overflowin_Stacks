post '/questions/:question_id/votes' do
  vote = Vote.new(user_id: current_user.id, voteable_id: params[:question_id], voteable_type: "Question")
    if params[:vote_type] == "Upvote"
      vote.value = 1
    else params[:vote_type] == "Downvote"
      vote.value = -1
    end

  # if request.xhr?
    if vote.save
  #     erb :'/questions/_question_votes_partial', layout: false, locals: {question: question}  
  # else
    redirect '/questions'
    # end
  end
end

post '/answers/:answer_id/votes' do
  vote = Vote.new(user_id: current_user.id, voteable_id: params[:answer_id], voteable_type: "Answer")

  if request.xhr?
    if params[:vote_type] == "Upvote"
      vote.value + 1
    elsif params[:vote_type] == "Downvote"
      vote.value (- 1)
    end
  end
  if vote.save
    redirect '/questions'
  else
    redirect '/questions'
  end
end

