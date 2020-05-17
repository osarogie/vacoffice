class AddRrnToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :rrn, :string
    add_index :orders, :rrn, unique: true
  end
end
