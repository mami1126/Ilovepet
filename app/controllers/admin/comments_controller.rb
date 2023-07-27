class Admin::CommentsController < ApplicationController
   def destroy
    Comment.find(params[:id]).destroy
    redirect_to spot_path(params[:spot_id])
   end
   
   private
   
   def comment_params
    params.require(:comment).permit(:rate).merge({review: params[:review]})
   end
end
