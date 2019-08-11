class AddCashToCheckouts < ActiveRecord::Migration[5.2]
  def change
    add_column :checkouts, :cash, :boolean
  end
end
