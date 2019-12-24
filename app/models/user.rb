class User < ApplicationRecord
  has_many :posts
  has_many :favorites, dependent: :destroy
  mount_uploader :image, PostImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
