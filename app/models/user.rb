class User < ActiveRecord::Base

  #Password Encryption
  has_secure_password

  # ActiveRecord Field Validations
  validates :username, :password, presence: true
  validates :username, on: :create, uniqueness: { case_sensitive: false, message: "An account has already been made with this username." }
  validates :username, :length => { :in => 6..30}
  validates :password, confirmation: {case_sensitive: true}
  validates :password, :length => { :minimum => 6 }

  # ActiveRecord Associations
  has_many :listings

end