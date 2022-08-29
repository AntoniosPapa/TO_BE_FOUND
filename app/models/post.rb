class Post < ApplicationRecord
  belongs_to :organisation

  validates :title, presence: true
  validates :content, presence: true
end
