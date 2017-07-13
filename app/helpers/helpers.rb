def pass_user
  if session[:id]
    @user = User.find(session[:id])
  end
end
