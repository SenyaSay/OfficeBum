class OrdersController < StoreController

  def index
    @orders = current_user.orders.includes(order_products: :product).page(params[:page]).per(20)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.build_with_products(order_attrs, @cart.products)
    if @order.save
      clear_cart
      redirect_to root_url
    else
      flash[:error] = @order.errors.full_messages
      render :new
    end
  end

  private

  def clear_cart
    cookies.delete :cart
  end

  def order_attrs
    params[:order].merge(user: current_user)
  end

end

