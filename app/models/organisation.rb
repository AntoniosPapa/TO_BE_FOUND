class Organisation < ApplicationRecord
  belongs_to :user
  has_many :posts, :donations
end
