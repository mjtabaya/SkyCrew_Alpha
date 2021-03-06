class Captain < ApplicationRecord
  belongs_to :user

  has_many :skyfarers, :dependent => :destroy

  has_many :arsenals, :dependent => :destroy
  has_many :weapons, through: :arsenals

  accepts_nested_attributes_for   :skyfarers

  validates :user, presence: true

  validates :name,
    length: { within: 2..20 },
    format: { with: /\A\w+\s*\w+\z/i },
    presence: true
end
