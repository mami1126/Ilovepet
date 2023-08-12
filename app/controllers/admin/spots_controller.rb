class Admin::SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save!
    redirect_to '/admin/spots'
    end
  end

  def index
    @spot = Spot.page(params[:page]).per(10)
    @q = Spot.ransack(params[:q])
    @spots = @q.result(distinct: true).page(params[:page]).per(8)
    @prefectures = Prefecture.all
  end

  def search
    @q = Spot.ransack(search_params)
    @spots = @q.result(distinct: true).page(params[:page]).per(8)
    @prefectures = Prefecture.all
    render :index
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

   def search_params
    params.require(:q).permit!
   end
end
