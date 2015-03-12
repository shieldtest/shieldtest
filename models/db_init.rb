require 'sequel'
require 'logger'
require 'shield'

Sequel.default_timezone = :utc
Sequel::Model.plugin :timestamps, :update_on_create=>true
Sequel::Model.plugin :validation_helpers

DB = Sequel.connect(ENV["DATABASE_URL"] || 'sqlite://dev.db', loggers: [Logger.new($stdout)])

require_relative 'createdb.rb' unless DB.table_exists?(:users)

#uncomment to auto-sync models with DB contraints
#Sequel::Model.plugin(:constraint_validations) 
#Sequel::Model.plugin(:auto_validations)