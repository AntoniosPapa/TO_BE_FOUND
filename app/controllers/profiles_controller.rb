class ProfilesController < ApplicationController
  # skip_before_action :authenticate_user!, except: :new
  before_action :set_profile, only: %i[show create edit update]

  def show
    @profile = current_user
    @skill = Skill.new
    @skills = Skill.where(user: @profile)
    @organisation = current_user.organisation
  end


  # def create
  #   @profile = Profile.new(profile_params)
  #   @profile.user = current_user

  #   if @profile.save
  #     redirect_to profile_path(@profile), notice: "Update ok"
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def edit
  #   # @profile = Profile.update(current_user)
  #   # @profile.user = current_user
  # end

  # def update
  #   @profile.update(current_user)
  #   redirect_to profile_path
  # end

  private

  def set_profile
    # @profile = Profile.find(params[:id])
    @profile = current_user
  end

  # def profile_params
  #   params.require(:profile).permit(:description, :first_name, :last_name)
  # end

end
