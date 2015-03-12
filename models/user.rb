class User < Sequel::Model
	include Shield::Model

	def self.fetch(identifier)
    filter(email: identifier).first
  end

  def self.[](id)
    get id
  end

  def validate
    super
    validates_presence :email
    validates_min_length 5, :email, :message=>"that's an awfully short email address" #i@.to
    validates_format /.+@.+\..+/i, :email, :message=>'does not seem to be a valid email'
  end

end