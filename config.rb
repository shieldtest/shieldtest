require 'sinatra/base'

require "./models/db_init"
Dir["./helpers/**/*.rb"].each { |f| require f }
Dir["./controllers/**/*.rb"].each { |f| require f }

if Sinatra::Base.environment == :development
    require 'dotenv'
    require 'awesome_print'
    Dotenv.load
end