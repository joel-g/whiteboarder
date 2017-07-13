get '/' do
  pass_user
  erb :'index'
end
