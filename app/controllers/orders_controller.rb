class OrdersController < ApplicationController
    def new 
        @order= Order.new
    end

    def create 
        @order=Order.new(order_params)
        if @order.save 
            flash[:success] = 'item added to cart'
            redirect_to goods_path
        else
            flash[:danger] = 'oops could not add item'
            redirect_to goods_path
        end
    end
    def order_params
        params.require(:order).permit(:quantity, :user_id, :good_id)
    end
end
