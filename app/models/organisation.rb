class Organisation < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :donations
end
