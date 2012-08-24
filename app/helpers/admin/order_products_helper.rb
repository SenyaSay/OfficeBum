module Admin::OrderProductsHelper

  def products(order_products)
    order_products.inject(""){|result, item| result + "#{item.product.name} #{item.quantity} #{item.price} " }
  end

end
