class Prefecture < ApplicationRecord
 validates :prefecture_name, presence: true, uniqueness: { case_sensitive: false }

end
