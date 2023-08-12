class Public::CommentsController < ApplicationController
     before_action :authenticate_customer!

  def create
    @spot = Spot.find(params[:spot_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.spot_id = @spot.id
    comment_count = Comment.where(spot_id: params[:spot_id]).where(customer_id: current_customer.id).count
    if @comment.valid?
      if comment_count < 1
        @comment.save
        redirect_to spot_path(@spot), notice: "コメントを保存しました"
      else
        redirect_to spot_path(@spot), notice: "コメントの投稿は一度までです"
      end
    else
     flash.now[:alert] = "コメントの保存に失敗しました"
       render :new
    end
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.new
  end

  def index
    @spot = Spot.find(params[:spot_id])
    @comments = @spot.comments.page(params[:page]).per(3)
  end

  def edit
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
     redirect_to customers_mypage_path, notice: "情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to spot_comments_path, alert: '投稿を削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:rate,:review)
  end

end
