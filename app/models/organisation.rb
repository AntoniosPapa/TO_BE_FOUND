class Organisation < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :donations
  has_one_attached :photo
  has_many :needs
end
