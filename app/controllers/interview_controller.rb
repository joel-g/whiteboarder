get '/interviews' do
  pass_user
  @interviews = Interview.all.order(created_at: :desc)
  erb :'interviews/index'
end

get '/interviews/new' do
  if session[:id]
    pass_user
    erb :'interviews/new'
  else
    redirect '/sessions/new'
  end
end

post '/interviews' do
  pass_user
  int = Interview.new(params[:int])
  if int.save
    redirect "/interviews/#{int.id}"
  else
    @error = 'All fields are required.'
    erb :'interviews/new'
  end
end

get '/interviews/:id' do
  if session[:id]
    pass_user
  end
  @interview = Interview.find(params[:id])
  erb :'interviews/show'
end
