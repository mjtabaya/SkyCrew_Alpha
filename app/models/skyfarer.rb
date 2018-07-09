class Skyfarer < ApplicationRecord

  belongs_to :captain
  has_one :arsenal

  validates :name, length: { maximum: 23 }, presence: true
  validates :race, length: { maximum: 23 }, presence: true
  validates :class, length: { maximum: 23 }, presence: true
  validates :state, length: { maximum: 23 }, presence: true


end
