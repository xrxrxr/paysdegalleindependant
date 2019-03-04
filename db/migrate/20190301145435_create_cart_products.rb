class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.belongs_to :product, foreign_key: true
   	  t.references :cartprodable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
