class DonationsController < ApplicationController
  before_action :set_organisation, only: %i[new create]

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.user = current_user
    @donation.organisation = Organisation.find(params[:organisation_id])

    if @donation.save
      redirect_to profiles_path(@profile)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    params.require(:donation).permit(:type_of_donation, :quantity)
  end
end
