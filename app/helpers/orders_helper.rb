module OrdersHelper
    def get_item(item_id)
        Good.find(item_id)
    end
    
    def selected_item(item_id)
        Order.where(user_id: item_id).count
    end

    def get_total_sum(all_orders)
        sum = []
        cart_good_ids = all_orders.where(user_id: current_user.id).pluck('good_id')
        cart_good_ids.each do | id |
            sum << Good.where(id: id).pluck('price')
        end
        number_to_currency(sum.flatten.reduce(0,:+))
    end
end
