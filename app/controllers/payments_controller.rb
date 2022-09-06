class PaymentsController < ApplicationController
  def new
    # @donation = current_user.donations.where(state: 'pending').find(params[:donation_id])
    @donation = current_user.donations
    # @donation = Organisation.find(params[:organisation_id])
    # @donation = Organisation.find(current_user)
  end
end
