get '/users/new' do
  erb :'users/new'
end

post '/users' do
  exiting_user_email = User.find_by(email: params[:user][:email])
  existing_user_username = User.find_by(username: params[:user][:username])
  if exiting_user_email
    @error = "email address already registered"
    erb :'users/new'
  elsif existing_user_username
    @error = "username is not available"
    erb :'users/new'
  end
  user = User.new(params[:user])
  if user.save
    redirect '/session/new'
  else
    if params[:user][:email] = "" ||
      @error = "email can't be blank"
      erb :'users/new'
    elsif params[:user][:username] = ""
      @error = "username can't be blank"
      erb :'users/new'
    end
  end
end

get '/sessions/new' do
  erb :'users/login'
end

post '/sessions' do

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
    @error = "Invalid password"
    erb :index
  end
end

delete '/sessions' do
  session.clear
  redirect '/'
end
