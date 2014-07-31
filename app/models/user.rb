class User < ActiveRecord::Base
  has_many :links

  has_secure_password

  validates :email, uniqueness: true
  validates :password, presence: { on: :create }, length: { minimum: 6, allow_blank: false }
end
