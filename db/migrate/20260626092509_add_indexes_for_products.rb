class AddIndexesForProducts < ActiveRecord::Migration[8.1]
  def change
    add_index :products, :sku , unique: true, name: "unique_product_sku"
    add_check_constraint :products, "price_cents > 0" , name: "price_cents_positive"
    add_check_constraint :products, "stock_quantity >= 0" , name: "stock_quantity_non_negative"
    
  end
end
