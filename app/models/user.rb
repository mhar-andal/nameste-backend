class User < ApplicationRecord
  has_secure_password

  validates :username, :first_name, :last_name, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
end
