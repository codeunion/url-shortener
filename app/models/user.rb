class User < ActiveRecord::Base
  has_many :links

  has_secure_password

  validates :email, uniqueness: true
end
