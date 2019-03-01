class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.decimal :total
      t.decimal :subtotal
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
