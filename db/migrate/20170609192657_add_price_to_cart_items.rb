class AddPriceToCartItems < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_items, :price, :decimal, precision: 6, scale: 2, default: 0
  end
end
