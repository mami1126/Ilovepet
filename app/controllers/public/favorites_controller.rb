class Public::FavoritesController < ApplicationController
  before_action :set_spot
  before_action :authenticate_customer!

  def create
    @favorite = Favorite.create(customer_id: current_customer.id, spot_id: @spot.id)
    redirect_back fallback_location: root_path
  end

  def destroy
    @favorite = Favorite.find_by(customer_id: current_customer.id, spot_id: @spot.id)
    @favorite.destroy
    redirect_back fallback_location: root_path
  end

  private
    def set_spot
      @spot = Spot.find(params[:spot_id])
    end
end
