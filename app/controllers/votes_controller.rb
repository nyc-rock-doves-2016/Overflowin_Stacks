post '/questions/:question_id/votes' do
  vote = Vote.build(user_id: current_user.id, voteable_id: params[:question_id], voteable_type: "Question")
  if request.xhr?
    if params[:vote_type] == "Upvote"
      vote.value + 1
    elsif params[:vote_type] == "Downvote"
      vote.value - 1
    end
  end
  if vote.save
  else
    
  end
end

post '/answers/:answer_id/votes' do
  vote = Vote.build(user_id: current_user.id, voteable_id: params[:answer_id], voteable_type: "Answer")

  if request.xhr?
    if params[:vote_type] == "Upvote"
      vote.value + 1
    elsif params[:vote_type] == "Downvote"
      vote.value - 1
    end
  end
  if vote.save
  else
    
  end
end

