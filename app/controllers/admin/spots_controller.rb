class Admin::SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end
  
  def create
    @spot = Spot.new(spot_params)
    # @prefecture = Prefecture.all
    if @spot.save!
    redirect_to '/admin/spots' 
    end
  end
  
  def index
    @spots = Spot.all
    @spot = Spot.page(params[:page]).per(10)
  end
  
  def show
    @spot = Spot.find(params[:id])
  end

  def edit
    @spot = Spot.find(params[:id])
  end
  
  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to '/admin/spots'
  end
  
  def update
    @spot = Spot.find(params[:id])

    if @spot.update(spot_params)
     flash[:notice] = "You have updated item successfully."
     redirect_to admin_spot_path(@spot.id)
    else
      render "edit"
    end
  end
  
   private
   def spot_params
    params.require(:spot).permit(:spot_name, :address, :access, :telephone_number, :url, :facility, :business_day, :opening_hours, :image, :genre_id, :prefectures_id)
   end
end
