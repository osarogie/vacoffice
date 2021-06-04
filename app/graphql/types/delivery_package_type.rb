module Types
  class DeliveryPackageType < RelayObject
    field :drop_off_address, String, null: true
    field :delivered_at, String, null: true
    field :recipient_name, String, null: true
    field :name, String, null: true
    field :recipient_phone, String, null: true
    field :status, Integer, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
  end
end
