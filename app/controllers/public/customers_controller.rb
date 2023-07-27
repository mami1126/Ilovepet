class Public::CustomersController < ApplicationController
  def show
    @customers = current_customer
    @comments = Comment.all
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:spot_id)
    @favorite_list = Spot.find(favorites)
    @favorited_spots = current_customer.favorited_spots
  end
  
   def edit
    @customer = current_customer
      render "edit"
   end
end
