class User < ApplicationRecord

  has_one :captain

  validates :name, :password, presence: true

  validates :name,
    length: { within: 5..20 },
    uniqueness: true,
    format: { with: /\A\w*\z/ }

  validates :password,
    length: { within: 5..20 },


end
