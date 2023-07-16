class Genre < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["genre_name"]
  end
end
