class PaymentsController < ApplicationController
  def new
    # @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    @order = current_user
  end
end
