class Arsenal < ApplicationRecord
  belongs_to :captain
  belongs_to :skyfarer, { :optional => true }
  belongs_to :weapon

  validates_associated :captain, :weapon
end
