class AddHomeDeliveryToCheckouts < ActiveRecord::Migration[5.2]
  def change
    add_column :checkouts, :home_delivery, :boolean ,default: false
  end
end
