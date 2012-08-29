class OrdersController < ApplicationController
  before_filter :load_cookies

  def new
    @cart = Cart.new(@cart_cookies)
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order].merge(user: current_user, status: Order::STATUS[0]))
    if @order.save
      order_products_create
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
    @cart = Cart.new
  end

  def order_products_create
    unless @cart_cookies.empty?
      @cart_cookies.each do |key, value|
        product = Product.find_by_id(key)
        if product
          OrderProduct.create(order: @order,
                              product_id: key,
                              quantity: value,
                              price: product.price)
        end
      end
    end
  end

  def load_cookies
    @cart_cookies = cookies[:cart] ? Marshal.load(cookies[:cart]) : {}
  end

end

