class Organisation < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :donations, dependent: :destroy
  has_one_attached :photo
  has_many :needs

  accepts_nested_attributes_for :needs, reject_if: :all_blank, allow_destroy: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name ],
      associated_against: {
      needs: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
