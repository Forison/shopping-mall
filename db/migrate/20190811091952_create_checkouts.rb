class CreateCheckouts < ActiveRecord::Migration[5.2]
  def change
    create_table :checkouts do |t|
      t.string :firstname
      t.string :lastname
      t.string :mobile
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
