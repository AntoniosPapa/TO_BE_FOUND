class OrganisationsController < ApplicationController
  skip_before_action :authenticate_user!, except: :new

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.user = current_user

    if @organisation.save
      redirect to organisation_path(@organisation), notice: "New organisation created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :address, :description, :photo, :website, :email, :first_name)
  end
end
