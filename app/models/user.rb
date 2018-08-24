class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_one :captain, :dependent => :destroy

  validates :username, :email, presence: true

  validates :username,
    length: { within: 5..20 },
    uniqueness: true,
    format: { with: /\A\w+\s*\w+\z/ }

  validates :email,
    length: { within: 9..30 },
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

  validates :password,
    length: { within: 8..20 }

  has_secure_password
  #does presence validation for passwords on create

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
