class Skill < ApplicationRecord
  belongs_to :user
  $skills = ["Photography", "Videography", "Construction Work", "Legal Advice", "Web Development", "Translation"]
end
