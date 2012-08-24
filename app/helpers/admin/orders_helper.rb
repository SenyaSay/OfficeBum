module Admin::OrdersHelper

  def status
    Order::STATUS.each{ |value| status = {value => value} }
  end

end
