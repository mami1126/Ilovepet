class Public::SpotsController < ApplicationController
  def index
    @q = Spot.ransack(params[:q])
    @spots_count = @q.result(distinct: true)
    @spots = @spots_count.page(params[:page]).per(8)
    @prefectures = Prefecture.all
  end

  def search
    @q = Spot.ransack(search_params)
    @spots_count = @q.result(distinct: true)
    @spots = @spots_count.page(params[:page]).per(8)
    @prefectures = Prefecture.all
    render :index
  end

  def show
    @spot = Spot.find(params[:id])
    @spots = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to spot_comments_path
  end

  def favorites
    @spots = current_customer.favorites_spots
  end

  private
  def search_params
    params.require(:q).permit!
  end


  def comment_params
    params.require(:comment).permit(:comment, :rate)
  end
end
