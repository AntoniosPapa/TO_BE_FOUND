class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :donations, :skill_offereds
  has_one :organisation

  validates :name, presence: true
  validates :address, presence: true
end
