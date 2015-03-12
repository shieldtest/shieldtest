require 'sinatra/base'

require "./models/db_init"
Dir["./helpers/**/*.rb"].each { |f| require f }
Dir["./controllers/**/*.rb"].each { |f| require f }

unless ENV["RACK_ENV"] == "production"
    require 'dotenv'
    require 'awesome_print'
    Dotenv.load
end