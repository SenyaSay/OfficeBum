class Admin::OrdersController < ApplicationController
  before_filter :find_order, :only => [:update, :destroy]

  def index
    @orders = Order.page(params[:page]).per(20)
  end

  def update
    if @order.update_attributes(status: params[:status])
      render :text => "OK"
    else
      render :text => "Error"
    end
  end

  def destroy
    @order.destroy
    redirect_to :action => :index
  end

  private

  def find_order
    @order = Order.find_by_id(params[:id])
  end

end
