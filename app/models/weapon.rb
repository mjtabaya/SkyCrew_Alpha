class Weapon < ApplicationRecord

  has_many :arsenals

  validates :name, :description, :type, presence: true

  validates :name,
  length: { maximum: 23 },
  uniqueness: true,
  format: { with: /\A\w+\s*\w+\z/i }

  validates :description,
  length: { maximum: 120 }

  validates :type,
  length: { maximum: 16 },
  format: { with: /\A\w+\s*\w+\z/i }

end
