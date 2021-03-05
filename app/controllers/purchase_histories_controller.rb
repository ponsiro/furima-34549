class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :check_user
  before_action :check_item_order

  def index
    @purchase_history_buyer_address = PurchaseHistoryBuyerAddress.new
  end

  def create
    @purchase_history_buyer_address = PurchaseHistoryBuyerAddress.new(purchase_history_params)
    if @purchase_history_buyer_address.valid?
      pay_item
      @purchase_history_buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_history_params
    params.require(:purchase_history_buyer_address).permit(:postal_code, :shipment_source_id, :city, :address_line_block, :address_line_building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_user
    redirect_to root_path if current_user.id == @item.user.id
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_history_params[:token],
      currency: 'jpy'
    )
  end

  def check_item_order
    @item = Item.find(params[:item_id])
    buy = PurchaseHistory.all
    @array = []
    buy.each do |i|
      @array << i.item_id
    end
    redirect_to root_path if @array.try(:include?, @item.id)
  end
end
