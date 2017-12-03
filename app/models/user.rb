class User < ApplicationRecord
  attr_accessible :name, :password, :password_confirmation
  has_secure_password

  validates :password, presence: true, confirmation: true, length: { minimum: 8 }

end
