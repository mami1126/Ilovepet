class Spot < ApplicationRecord
  has_one_attached :image




validates :spot_name, presence: true
validates :address, presence: true
validate :access
validate :telephone_number
validate :url
validate :facility
validate :business_day
validate :opening_hours



end