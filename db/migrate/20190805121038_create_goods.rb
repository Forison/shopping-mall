class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :name
      t.string :brand
      t.string :category
      t.string :gender
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
