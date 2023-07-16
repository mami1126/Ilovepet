class Spot < ApplicationRecord
  has_one_attached :image

  belongs_to :customer, optional: true
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  #  belongs_to :prefecture
  validates :spot_name, presence: true
  validates :address, presence: true
  validate :access
  validate :telephone_number
  validate :url
  validate :facility
  validate :business_day
  # validate :opening_hours

  def self.ransackable_attributes(auth_object = nil)
    ["id","genre_id", "prefectures_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["genre", "prefecture"]
  end
end