class Captain < ApplicationRecord

  belongs_to :user
  has_many :skyfarers
  has_many :arsenals

  validates :user_id, :name, presence: true

  validates :name,
    length: { within: 5..20 },
    format: { with: /\A\w*\z$/i }

end
