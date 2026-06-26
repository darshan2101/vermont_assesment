class AddIndexesOnOrderItems < ActiveRecord::Migration[8.1]
  def change
    add_check_constraint :order_units, "quantity >=1 " , name: "quantity_at_least_one"
  end
end
