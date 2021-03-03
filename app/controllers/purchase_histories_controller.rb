class PurchaseHistoriesController < ApplicationController
  def index
    @purchase_history_buyer_address = PurchaseHistoryBuyerAddress.new
  end

  def create
    @purchase_history_buyer_address = PurchaseHistoryBuyerAddress.new(purchase_history_params)
    if @purchase_history_buyer_address.valid?
      @purchase_history_buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_history_params
    params.require(:purchase_history_buyer_address).permit(:postal_code, :shipment_source_id, :city, :address_line_block, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
