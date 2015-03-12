class ApplicationController < Sinatra::Base
  helpers ApplicationHelper
  helpers Shield::Helpers

  require_relative "../models/user.rb"

  configure do
    enable :logging, :sessions, :method_override
    use Rack::Session::Cookie, secret: "FiliBu7SterHankerCH11!Fen"
    set :root, File.expand_path("../../", __FILE__)
    use Shield::Middleware, "/login"
  end

  get '/' do
    erb "<h1>#{ENV["SITENAME"]}</h1><p>Struggling with redirect to params[:return] after authentication via middleware.</p>"
  end

  get '/noway' do
    error(401) unless authenticated(User)
    erb :app_noway
  end  

  get '/login' do
    erb :login
  end

  post "/login" do
    if login(User, params[:login], params[:password])
      remember(authenticated(User)) if params[:remember_me]
      redirect(params[:return] || "/")
    else
      redirect "/login"
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    if user = User.create(params[:user])
      redirect "/"
    else
      redirect "/signup"
    end
  end

  get "/logout" do
    logout(User)
    redirect "/"
  end

  not_found do
    status 404
    erb :not_found
  end
  
end
