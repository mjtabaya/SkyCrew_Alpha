class Skyfarer < ApplicationRecord

  belongs_to :captain
  has_one :arsenal
  has_one :weapon, through: :arsenals

  validates :name, :race, :profession, :state, presence: true

  validates :name,
  length: { maximum: 23 },
  format: { with: /\A\w+\s*\w+\z/i }

  validates :race,
  length: { maximum: 15 },
  format: { with: /\A\w+\s*\w+\z/i }

  validates :profession,
  length: { maximum: 23 },
  format: { with: /\A\w+\s*\w+\z/i }

  validates :state,
  length: { maximum: 23 },
  format: { with: /\A\w+\s*\w+\z/i }


end
