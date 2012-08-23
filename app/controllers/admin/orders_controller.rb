class Admin::OrdersController < ApplicationController
  before_filter :order_find, :only => [:edit, :update]

  def index
    @orders = Order.page(params[:page]).per(20)
  end

  def edit

  end

  def update
    if @order.update_attributes(params[:order])
      redirect_to :action => :index
    else
      flash[:error] = @order.errors.full_messages
      render :edit
    end
  end

  private

  def order_find
    @order = Order.find(params[:id])
  end

end
