class AddAtPickUpToCheckouts < ActiveRecord::Migration[5.2]
  def change
    add_column :checkouts, :at_pick_up, :boolean, default: false
  end
end
