class OrganisationsController < ApplicationController
  skip_before_action :authenticate_user!, except: :new

  def index
    @organisations = Organisation.all
  end

  def new
    @organisation = Organisation.new
  end

  def show
    @organisation = Organisation.new

    # set_organisation

    # if @organisation.save
    #   redirect_to organisation_path(@organisation), notice: "Here is the organisation!"
    # else
    #   render :show, status: :unprocessable_entity
    # end
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.user = current_user

    if @organisation.save
      redirect_to root_path(@organisation), notice: "New organisation created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_organisation
  end

  def update
    set_organisation
    @organisation.update(organisation_params)
    redirect_to root_path
  end

  private

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  def organisation_params
    params.require(:organisation).permit(:name, :address, :description, :photo, :website, :email)
  end
end
