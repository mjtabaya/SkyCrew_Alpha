class Skyfarer < ApplicationRecord

  belongs_to :captain
  has_one :arsenal, :dependent => :destroy
  has_one :weapon, through: :arsenals

  validates :name, :race, :profession, :state, presence: true

  validates :name,
  length: { maximum: 23 },
  format: { with: /\A\w+\s*\w*\s*\w+\z/i }

  validates :race,
  length: { maximum: 15 },
  format: { with: /\A\w+\s*\w+\z/i }

  validates :profession,
  length: { maximum: 23 },
  format: { with: /\A\w+\s*\w+\z/i }

  validates :state,
  length: { maximum: 23 },
  format: { with: /\A\w+\s*\w+\z/i }

  def set_stats(skyfarer = self)
    case skyfarer.profession
    when "Fighter"
      skyfarer.base_attack = 5
      skyfarer.base_defense = 5
    when "Thief"
      skyfarer.base_attack = 3
      skyfarer.base_defense = 3
    when "Ranger"
      skyfarer.base_attack = 5
      skyfarer.base_defense = 3
    when "Knight"
      skyfarer.base_attack = 3
      skyfarer.base_defense = 7
    when "Warlock"
      skyfarer.base_attack = 3
      skyfarer.base_defense = 3
    when "Enhancer"
      skyfarer.base_attack = 3
      skyfarer.base_defense = 3
    when "Priest"
      skyfarer.base_attack = 3
      skyfarer.base_defense = 3
    when "Harpist"
      skyfarer.base_attack = 3
      skyfarer.base_defense = 3
    when "Grappler"
      skyfarer.base_attack = 3
      skyfarer.base_defense = 3
    when "Dragoon"
      skyfarer.base_attack = 3
      skyfarer.base_defense = 3
    when "Wizard"
      skyfarer.base_attack = 3
      skyfarer.base_defense = 3
    end
  end

end
