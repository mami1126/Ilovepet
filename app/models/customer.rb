class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spots, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_spots, through: :favorites, source: :spot
  has_many :comments, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "ゲスト"
    end
  end

  def mine?(object)
   object.customer_id == id
  end

  def favorite(spot)
   favorites_spots << post
  end

  def unfavorite(spot)
   favorites_spots.destroy(post)
  end

  def favorite?(spot)
   favorites_spots.include?(post)
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end

