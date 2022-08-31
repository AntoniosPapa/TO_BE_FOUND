class DonationsController < ApplicationController

  def create
    @donation = Donation.new(donation_params)
    @organisation = Organisation.find(params[:organisation_id])
    @donation.organisation = @organisation
    @donation.user = current_user

    if @donation.save
      redirect_to organisation_path(@organisation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:type_of_donation, :quantity)
  end
end
