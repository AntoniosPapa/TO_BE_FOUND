class Post < ApplicationRecord
  belongs_to :organisation

  validates :title, presence: true
  validates :content, presence: true
  has_one_attached :photo
end
