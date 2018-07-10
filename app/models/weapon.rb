class Weapon < ApplicationRecord

  has_many :arsenals

  validates :name, :description, :type, presence: true

  validates :name,
  length: { maximum: 23 },
  uniqueness: true

  validates :description,
  length: { maximum: 120 },

  validates :type,
  length: { maximum: 16 },

end
