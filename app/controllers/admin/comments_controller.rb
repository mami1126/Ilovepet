class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_customer_path(@comment.customer)
  end

  def comment_params
    params.require(:comment).permit(:rate).merge({ review: params[:review] })
  end
end
