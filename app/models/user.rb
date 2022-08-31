class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :donations
  has_many :skills
  has_one :organisation
end
