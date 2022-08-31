class SkillsController < ApplicationController
  def create
    @skill = Skills.new(skill_params)
    @skill.user = current_user
    if @skill.save
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @skill.update(skill_params)
    redirect_to profile_path
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
