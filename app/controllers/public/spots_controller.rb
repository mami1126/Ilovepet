class Public::SpotsController < ApplicationController
  def index
    @q = Spot.ransack(params[:q])
    @spots = @q.result(distinct: true)
    @prefectures = Prefecture.all
    @spot = Spot.page(params[:page]).per(8)
  end

  def search
    @q = Spot.ransack(search_params)
    @spots = @q.result(distinct: true)
  end

  def show
    @spot = Spot.find(params[:id])
    @spots = Comment.new
  end
  
  def favorites
    @spots = current_customer.favorites_spots
  end

  private
  def search_params
    params.require(:q).permit!
  end
  
 

end
