class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :address
      t.decimal :total

      t.timestamps
    end
  end
end
