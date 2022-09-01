class Need < ApplicationRecord
  belongs_to :organisation
  NEEDS = ["Photography", "Videography", "Construction Work", "Legal Advice"]
end
