get '/answers/:answer_id/comments/new' do
  @answer = Answer.find_by(id: params[:id])
end