class Public::SpotsController < ApplicationController
  def index
  @q = Spot.ransack(params[:q])
  @spots = @q.result(distinct: true)
  end
  
  def search
    @q = Spot.ransack(search_params)
    @spots = @q.result(distinct: true)
  end

  private
  def search_params
    params.require(:q).permit!
  end
end
