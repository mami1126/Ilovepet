class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customer = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @comment = Comment.all
  end


  private
    def customer_params
      params.require(:customer).permit(:name)
    end
end
