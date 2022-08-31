class SkillsOffersController < ApplicationController
  def new
    @skills_offers = SkillsOffers.new
  end

  def create
    @skills_offers = SkillsOffers.new(skills_offers_params)
    @skills_offers.user = current_user
  end

  def edit

  end

  def update
    @skills_offers.update(skills_offers_params)
    redirect_to profile_path
  end

  private

  def skills_offers_params
    params.require(:skills_offers).permit(:skills)
  end
end
