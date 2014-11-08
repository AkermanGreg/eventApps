class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_secure_password

  validates_uniqueness_of :email
  
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
 

  has_many :events

validates_length_of :email, :password_digest, :allow_blank => false

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

end
