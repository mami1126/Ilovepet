class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @spots = @customer.spots

    favorites = Favorite.where(customer_id: current_customer.id).pluck(:spot_id)
    @favorite_list = Spot.find(favorites)
  end
end
