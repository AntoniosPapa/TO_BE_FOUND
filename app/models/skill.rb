class Skill < ApplicationRecord
  belongs_to :user
  SKILLS = ["Photographer", "Videographer", "Construction Helpers", "Legal Advisor", "Cook", "Echologist", "Botanologist", "Web Developer", "Medic", "Architect"]
end
