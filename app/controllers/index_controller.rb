get '/' do
  pass_user
  @challenges = Challenge.all
  erb :'index'
end
