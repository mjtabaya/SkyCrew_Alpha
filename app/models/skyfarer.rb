class Skyfarer < ApplicationRecord

  belongs_to :captain
  has_one :arsenal

  validates :name, :race, :profession, :state, presence: true

  validates :name,
  length: { maximum: 23 },

  validates :race,
  length: { maximum: 15 },
  presence: true

  validates :profession,
  length: { maximum: 23 },

  validates :state,
  length: { maximum: 23 },


end
