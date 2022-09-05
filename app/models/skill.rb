class Skill < ApplicationRecord
  belongs_to :user
  SKILLS_AND_ICONS = { "Photographer" => "photographer.png",
    "Videographer" => "videographer.png",
    "Construction Helpers" => "construction-worker.png",
    "Legal Advisor" => "lawyer.png",
    "Cook" => "cook.png",
    "Ecologist" => "ecologist.png",
    "Botanologist" => "botanologist.png",
    "Web Developer" => "web-developer.png",
    "Medic" => "medic.png",
    "Architect" => "architect.png"}
end
