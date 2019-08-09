module OrdersHelper
    def get_item(item_id)
        Good.find(item_id)
    end
    
    def selected_item(item_id)
        Order.find(item_id).size
    end
end
