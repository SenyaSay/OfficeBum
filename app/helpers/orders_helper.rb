module OrdersHelper
  def products(order_products)
    order_products.inject('') do |result, item|
      result + content_tag(:div, "#{item.product.name} #{item.quantity} #{item.price}")
    end
  end

  def select_status(order)
    select :status, nil, status(order), { selected: order.status }, { id: order.id, :class => 'select' }
  end

  private

  def status(order)
    ([order.status] + order.state_transitions.map(&:to)).map {| k| [t("status.#{k}"), k]}
  end
end
