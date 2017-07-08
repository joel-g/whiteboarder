post '/users/login' do
  @user = User.find_by(username: params[:username])
  if @user == nil
    @user = User.find_by(email: params[:username])
  end
  if User.authenticate(@user.username ,params[:password])
    session[:id] = @user.id
    redirect "/"
  else
    @error = "Invalid login"
    redirect "/"
  end
end

post '/users/logout' do
  session.clear
  redirect '/'
end
