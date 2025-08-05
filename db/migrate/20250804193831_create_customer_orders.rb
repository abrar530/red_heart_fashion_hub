class CreateCustomerOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :customer_orders do |t|
      t.string :customer_name
      t.string :address
      t.string :province
      t.decimal :total_price

      t.timestamps
    end
  end
end
