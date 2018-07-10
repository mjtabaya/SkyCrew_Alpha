class User < ApplicationRecord

  has_one :captain

  validates :username, :email, presence: true

  validates :username,
    length: { within: 5..20 },
    uniqueness: true,
    format: { with: /\A\w*\z/ }

  validates :email,
    length: { within: 9..30 },
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

  validates :password,
    length: { within: 8..20 }

  has_secure_password
  #does presence validation for passwords on create

end
