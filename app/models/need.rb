class Need < ApplicationRecord
  belongs_to :organisation
  NEEDS = ["Photographer", "Videographer", "Construction Helpers", "Legal Advisor", "Cook", "Echologist", "Botanologist", "Web Developer", "Medic", "Architect"]
end
