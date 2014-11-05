class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_secure_password

  validates_uniqueness_of :email
  
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
 

  has_many :events

  

end
