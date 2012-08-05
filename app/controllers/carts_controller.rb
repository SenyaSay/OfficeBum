class CartsController < ApplicationController

  def update
    @cart = if cookies[:cart].blank?
              {params[:id] => 1}
            else
              Marshal.load(cookies[:cart]).merge(params[:id] => 1)
            end
    cookies[:cart] = {:value => Marshal.dump(@cart)}
  end

  def destroy
    cookies.delete :cart
    @cart = {}
  end
end
