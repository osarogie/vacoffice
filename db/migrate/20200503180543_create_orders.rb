class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone_number
      t.text :pickup_address
      t.text :delivery_address
      t.timestamp :delivered_at
      t.timestamp :picked_up_at
      t.integer :payment_option, default: 0
      t.monetize :amount
      t.integer :order_status, default: 0
      t.references :user

      t.timestamps
    end
  end
end
