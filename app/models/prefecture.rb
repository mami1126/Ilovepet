class Prefecture < ApplicationRecord
  validates :prefecture_name, presence: true, uniqueness: { case_sensitive: false }

  # belongs_to :spot
end
