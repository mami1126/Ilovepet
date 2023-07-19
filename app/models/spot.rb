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

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id","genre_id", "prefectures_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["genre", "prefecture"]
  end
end