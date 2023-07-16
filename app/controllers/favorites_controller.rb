class FavoritesController < ApplicationController
  before_action :set_spot
  before_action :authenticate_customer!
  
  def create
    if @spot.customer_id != current_customer.id
      @favorite = Favorite.create(customer_id: current_customer.id, spot_id: @spot.id)
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(customer_id: current_customer.id, spot_id: @spot.id)
    @favorite.destroy
  end

  private
  def set_spot
    @spot = Spot.find(params[:spot_id])
  end
end
