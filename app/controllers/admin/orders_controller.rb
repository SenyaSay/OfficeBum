class Admin::OrdersController < Admin::BaseController
  before_filter :find_order, :only => [:update, :destroy]

  def index
    @orders = Order.includes(:user, order_products: :product).page(params[:page]).per(20)
  end

  def update
    text = @order.update_attributes(status: params[:status]) ? 'OK' : 'Error'
    render text: text
  end

  def destroy
    @order.destroy
    redirect_to action: :index
  end

  private

  def find_order
    @order = Order.find_by_id(params[:id])
  end
end
