class Admin::SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end
  
  def create
    @spot = Spot.new(spot_params)
    @spot.save
    redirect_to '/admin/spots' 
  end
  
  def index
    @spot = Spot.all
  end
  
   private
   def spot_params
    params.require(:spot).permit(:spot_name, :address, :access, :telephone_number, :url, :facility, :business_day, :opening_hours, :image, :genre_id)
   end
end
