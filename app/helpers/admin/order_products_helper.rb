module Admin::OrderProductsHelper

  def cart(order_products)
    text = ''
    order_products.each{ |value| text << value.product.name << " " << value.quantity.to_s << " " << value.price.to_s << " " }
    text
  end

end
