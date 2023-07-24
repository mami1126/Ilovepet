class Favorite < ApplicationRecord
  
  belongs_to :customer
  belongs_to :spot
  
  validates_uniqueness_of :spot_id, scope: :customer_id
  
end
