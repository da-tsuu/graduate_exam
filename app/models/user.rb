class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :introduce, length: { maximum: 255 }

  mount_uploader :image, ProfileIconUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
