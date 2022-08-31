class NeedsController < ApplicationController
  def create
    @need = Need.new(need_params)
    @need.organisation = Organisation.find(params[:organisation_id])

    if @need.save
      redirect_to organisation_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def update
  #   @need.update(need_params)
  #   @need.organisation = Organisation.find(params[:organisation_id])
  #   redirect_to profile_path
  # end

  private

  def need_params
    params.require(:need).permit(:name, :description)
  end
end
