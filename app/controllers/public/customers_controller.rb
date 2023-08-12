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

   def update
    @customer = Customer.find(params[:id])
    @customer.id = current_customer.id
    if @customer.update(customer_params)
      redirect_to customers_mypage_path(@customer), notice: "情報を更新しました。"
    else
      render "edit"
    end
   end

  private
   def customer_params
    params.require(:customer).permit(:name, :image)
   end

end
