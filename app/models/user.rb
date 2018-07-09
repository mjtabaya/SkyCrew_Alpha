class User < ApplicationRecord

  has_one :captain

  validates :password, length: { maximum: 23 }, presence: true


end
