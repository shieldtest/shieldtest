DB.extension(:constraint_validations)
DB.create_constraint_validations_table

#uncomment models/init.rb to enable auto-sync with DB contraints

# Create a new User table with columns of
# id, name, email and password_digest.
DB.create_table :users do 
  primary_key :id
  column :email, String, null: false
  column :crypted_password, String, null: false
  column :name, String
  column :created_at, DateTime
  column :updated_at, DateTime
  index :email, :unique=>true
  validate do
    presence :email
    min_length 5, :email
    unless ENV['DATABASE_URL'] == 'sqlite://dev.db'
      format /.+@.+\..+/i, :email
    end
  end
end