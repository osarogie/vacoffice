class AddContactDetailsToOrders < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :phone_number, :sender_phone
    add_column :orders, :sender_name, :string
    add_column :orders, :recipient_name, :string
    add_column :orders, :recipient_phone, :string
  end
end
