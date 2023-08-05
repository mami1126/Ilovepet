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
    @comment = Comment.new
  end

  def index
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.page(params[:page]).per(6)
    @comments = @spot.comments
  end

  def edit
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
     flash[:notice] = "You have updated comment successfully."
     redirect_to customers_mypage_path, notice: "情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to spot_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:rate,:review)
  end

end
