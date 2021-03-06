require 'sinatra'
require 'rest-client'
require 'json'

CLIENT_ID = ENV['GH_BASIC_CLIENT_ID']
CLIENT_SECRET = ENV['GH_BASIC_SECRET_ID']

get '/' do
  pass_user
  @challenges = Challenge.all
  erb :'index', :locals => {:client_id => CLIENT_ID}
end

get '/callback' do
  # get temporary GitHub code...
  session_code = request.env['rack.request.query_hash']['code']
  # ... and POST it back to GitHub
  result = RestClient.post('https://github.com/login/oauth/access_token',
                          {:client_id => CLIENT_ID,
                           :client_secret => CLIENT_SECRET,
                           :code => session_code},
                           :accept => :json)
  # extract the token and granted scopes
  access_token = JSON.parse(result)['access_token']
  # check if we were granted user:email scope
  scopes = JSON.parse(result)['scope'].split(',')
  has_user_email_scope = scopes.include? 'user:email'
  # fetch user information
  auth_result = JSON.parse(RestClient.get('https://api.github.com/user',
                                        {:params => {:access_token => access_token}}))
# if the user authorized it, fetch private emails
  if has_user_email_scope
    auth_result['private_emails'] =
      JSON.parse(RestClient.get('https://api.github.com/user/emails',
                                {:params => {:access_token => access_token}}))
  end
  p auth_result
  if !auth_result['email'].nil? && !auth_result['email'].empty?
    github_user = User.find_by(email: auth_result['email'])
    if github_user
      @user = github_user
      session[:id] = github_user.id
    else
      new_user = User.new(username: auth_result['login'], email: auth_result['email'], name: auth_result['name'], password: auth_result['id'])
      if new_user.save
        @user = new_user
        session[:id] = new_user.id
      end
    end
  end

    erb :basic, :locals => auth_result
end
