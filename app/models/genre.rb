class Genre < ApplicationRecord
  
  validates :genre_name, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    ["genre_name"]
  end
end
