class CartsController < ApplicationController
  def index
    @checkout = Checkout.new
    @cart = Order.where(user_id: current_user.id)
    @all_orders = Order.all
  end

  def create_checkout
    @checkout = Checkout.new(checkout_params)
    if @checkout.save
      flash[:success] = "saved to checkout"
      redirect_to carts_path
    else
      flash[:danger] = "failed to checkout"
      redirect_to carts_path
    end
  end

  def destroy 
    order= Order.find(params[:id])
    order.destroy
    if order.destroy
      flash[:success] = 'item has been removed from cart'
      redirect_to carts_path
    else 
      flash[:danger] = 'oops!!! items could not be removed'
      redirect_to carts_path
    end
  end

  def checkout_params
    params.require(:checkout).permit(:lastname ,:firstname, :mobile, 
    :location ,:home_delivery , :user_id , :at_pick_up , :selected, :cash, :momo)
  end
end
