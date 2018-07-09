class Captain < ApplicationRecord

  belongs_to :user
  has_many :skyfarers
  has_many :arsenals

  validates :name, length: { maximum: 23 }, presence: true

end
