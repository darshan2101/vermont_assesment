class CreateOrderUnits < ActiveRecord::Migration[8.1]
  def change
    create_table :order_units do |t|
      t.integer :quantity
      t.integer :unit_price_cents
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
