class Weapon < ApplicationRecord

  has_many :arsenals

  validates :name, length: { maximum: 23 }, presence: true
  validates :description, length: { maximum: 120 }, presence: true
  validates :type, length: { maximum: 16 }, presence: true

end
