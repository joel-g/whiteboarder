post '/interviews/:inteview_id/feedbacks' do
  review = Feedback.new(params[:feed])
  @interview = Interview.find(params[:feed][:interview_id])
  pass_user
  if review.save
    # @success = 'Thank you for your review!'
    # erb :'interview/show'
  else
    # @error = 'all fields are required'
    # erb :'restaurants/show'
  end
end
