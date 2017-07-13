get '/' do
  pass_user
  @interviews = Interview.all.order(created_at: :desc)
  erb :index
end
