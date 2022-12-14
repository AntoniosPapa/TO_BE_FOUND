class OrganisationsController < ApplicationController
  skip_before_action :authenticate_user!, except: :new

  def index
    if params[:query].present?
      # @organisations = Organisation.where("name ILIKE ?", "%#{params[:query]}%")
      @organisations = Organisation.global_search(params[:query])
    else
      @organisations = Organisation.all
    end

    @markers = @organisations.geocoded.map do |organisation|
      {
        lat: organisation.latitude,
        lng: organisation.longitude,
        info_window: render_to_string(partial: "info_window", locals: {organisation: organisation}),
        # image_url: helpers.asset_url("location-dot-solid.png")
      }
    end
  end


  def show
    @organisation = Organisation.find(params[:id])
    @donation = Donation.new
    @need = Need.new
    @needs = @organisation.needs
    @post = Post.new
    @post = @organisation.posts
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.user = current_user

    if @organisation.save
      redirect_to organisations_path(@organisation), notice: "New organisation created"
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
    redirect_to organisation_path
  end

  private

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  def organisation_params
    params.require(:organisation).permit(:name, :address, :description, :photo, :website, :email, needs_attributes: [:id, :_destroy, :description, :name])
  end
end
