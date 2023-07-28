class Public::CommentsController < ApplicationController

  def create
    @spot = Spot.find(params[:spot_id])
    comment = current_customer.comments.new(comment_params)
    comment.spot_id = @spot.id
    comment.save
    redirect_to spot_path(@spot)
  end

  def new
    @spot = Spot.find(params[:spot_id])
  end

  def index
    @spot = Spot.find(params[:spot_id])
    @comments = @spot.comments
    if @comments.count == 0
      redirect_to new_spot_comment_path(@spot.id)
    end
  end

  def edit
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
    redirect_to spot_comment_path
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to spot_path(params[:spot_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:rate).merge({review: params[:review]})
  end

end
