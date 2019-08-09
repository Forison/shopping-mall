class CartsController < ApplicationController
  def index
    @cart = Order.where(user_id: current_user.id)
  end
end
