class AddQuantityToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :quantity, :integer, default: 1
  end
end
