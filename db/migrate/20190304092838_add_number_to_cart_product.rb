class AddNumberToCartProduct < ActiveRecord::Migration[5.2]
  def change
  	add_column :cart_products, :number, :integer, default: 1
  end
end
