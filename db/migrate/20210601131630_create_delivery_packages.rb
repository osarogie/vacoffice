class CreateDeliveryPackages < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_packages do |t|
      t.text :drop_off_address
      t.references :order, null: false, foreign_key: true
      t.timestamp :delivered_at
      t.string :recipient_name
      t.string :recipient_phone
      t.integer :status

      t.timestamps
    end
  end
end
