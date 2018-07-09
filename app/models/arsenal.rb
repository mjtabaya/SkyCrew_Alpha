class Arsenal < ApplicationRecord

  belongs_to :captain
  belongs_to :subject, { :optional => true }
  belongs_to :weapon

end
