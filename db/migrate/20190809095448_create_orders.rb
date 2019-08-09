class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.references :user, foreign_key: true
      t.references :good, foreign_key: true

      t.timestamps
    end
  end
end
