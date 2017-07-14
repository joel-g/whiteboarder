post '/interviews/:inteview_id/feedbacks' do
  feedback = Feedback.new(params[:feed])
  @interview = Interview.find(params[:feed][:interview_id])
  pass_user
  if feedback.save
    redirect "/interviews/#{@interview.id}"
  else
    @error = 'all fields are required'
    erb :'interviews/show'
  end
end
