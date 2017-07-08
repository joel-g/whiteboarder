post '/users/login' do
  @user = User.find_by(username: params[:username])
  if @user == nil
    @user = User.find_by(email: params[:username])
  end
  if @user == nil
    @error = "User not found"
    erb :index
  elsif User.authenticate(@user.username ,params[:password])
    session[:id] = @user.id
    redirect "/"
  else
    @error = "Invalid login"
    erb :index
  end
end

post '/users/logout' do
  session.clear
  redirect '/'
end
