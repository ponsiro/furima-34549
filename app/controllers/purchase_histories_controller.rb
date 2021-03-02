class PurchaseHistoriesController < ApplicationController
  def index
    @purchase_history_buyer_address = PurchaseHistoryBuyerAddress.new
  end
end
