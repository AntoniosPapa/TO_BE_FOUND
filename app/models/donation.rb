class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :organisation
end
