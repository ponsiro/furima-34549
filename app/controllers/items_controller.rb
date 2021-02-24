class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  
  
  def index
  end

  def new
    
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:name, :about, :category_id, :ststus_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
