class AddNameToDeliveryPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :delivery_packages, :name, :string
  end
end
