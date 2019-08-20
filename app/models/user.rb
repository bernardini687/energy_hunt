class User < ApplicationRecord
  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/

  has_secure_password # Adds password, password_confirmation and validations
end
