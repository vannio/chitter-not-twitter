class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, "hello_this_is_dog"

  register Sinatra::Flash
  use Rack::MethodOverride

  get "/" do
    erb(:index)
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end