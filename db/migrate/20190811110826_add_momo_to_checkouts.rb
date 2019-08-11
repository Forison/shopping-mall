class AddMomoToCheckouts < ActiveRecord::Migration[5.2]
  def change
    add_column :checkouts, :momo, :boolean
  end
end
