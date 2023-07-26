class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @spots = @customer.spots

    favorites = Favorite.where(customer_id: current_customer.id).pluck(:spot_id)
    @favorite_list = Spot.find(favorites)
  end
end
