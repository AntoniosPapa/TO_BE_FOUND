class Need < ApplicationRecord
  belongs_to :organisation
  NEEDS_AND_ICONS = { "Photography" => "photographer.png",
    "Videography" => "videographer.png",
    "Construction Work" => "construction-worker.png",
    "Legal Advice" => "lawyer.png",
    "Cook" => "cook.png",
    "Ecology" => "ecologist.png",
    "Botany" => "botanologist.png",
    "Web Development" => "web-developer.png",
    "Health Services" => "medic.png",
    "Architecture" => "architect.png"}
end
