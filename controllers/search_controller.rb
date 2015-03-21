require_relative 'application_controller'

class SearchController < ApplicationController

  get '/' do
    erb :search
  end

  get '/noway' do
    error(401) unless authenticated(User)
    erb :search_noway
  end

end
