class DonationsController < ApplicationController


  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @organisation = Organisation.find(params[:organisation_id])
    @donation.organisation = @organisation
    @donation.user = current_user

    if @donation.save
      redirect_to thankyou_path(@organisation), notice: "New donation's been made"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def donation_params
    params.require(:donation).permit(:type_of_donation, :description, :quantity)
  end
end
