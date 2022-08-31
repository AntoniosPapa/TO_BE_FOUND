class Skill < ApplicationRecord
  belongs_to :user
  SKILLS = ["Photography", "Videography", "Construction Work", "Legal Advice" ]
end
