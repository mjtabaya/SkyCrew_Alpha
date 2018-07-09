class Arsenal < ApplicationRecord

  belongs_to :captain
  belongs_to :subject, { :optional => true }
  has_one :weapon

end
