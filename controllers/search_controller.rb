require_relative 'application_controller'

class SearchController < ApplicationController

  get '/' do
    erb :search
  end

  get '/noway' do
    erb :search_noway
  end

end
