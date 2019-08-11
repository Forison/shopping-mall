class AddSelectedToCheckouts < ActiveRecord::Migration[5.2]
  def change
    add_column :checkouts, :selected, :integer, array: true, default: []
  end
end
