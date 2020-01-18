class User < ApplicationRecord

  has_secure_password
  validates :name, {presence: true, format: {with: /\A[a-zA-Z0-9]+\z/ }, length: {maximum: 16} }
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, maximum: 24 }

end
