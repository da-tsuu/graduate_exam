class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true
  validates :message, presence: true
  mount_uploader :image, PostImageUploader
end
