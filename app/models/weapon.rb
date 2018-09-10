class Weapon < ApplicationRecord
  has_many :arsenals, :dependent => :destroy
  has_many :captains, through: :arsenals
  belongs_to :skyfarer, { :optional => true }

  validates :name, :description, :weapon_type, presence: true

  validates :name,
  length: { maximum: 23 },
  uniqueness: true,
  format: { with: /\A\w+\s*\w+\z/i }

  validates :description,
  length: { maximum: 120 }

  validates :weapon_type,
  length: { maximum: 16 },
  format: { with: /\A\w+\s*\w+\z/i }

  # Multipliers:
  # Sabre 1.5
  # Dagger 0.8
  # Bow 1.1
  # Gun 1.2
  # Staff 0.6
  # Harp 0.5
end
