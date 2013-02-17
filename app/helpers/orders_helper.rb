module OrdersHelper
  def products(order_products)
    order_products.inject('') do |result, item|
      result + content_tag(:div, "#{item.product.name} #{item.quantity} #{item.price}")
    end
  end
end
