class Post < ApplicationRecord
  has_one_attached :cover_image

  validates :title, presence: true
end
