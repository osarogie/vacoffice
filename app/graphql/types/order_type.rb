module Types
  class OrderType < RelayObject
    field :name, String, null: true
    field :sender_name, String, null: true
    field :sender_phone, String, null: true
    field :recipient_name, String, null: true
    field :recipient_phone, String, null: true
    field :pickup_address, String, null: true
    field :delivery_address, String, null: true
    field :delivered_at, String, null: true
    field :picked_up_at, String, null: true
    field :payment_option, Integer, null: true
    field :amount_cents, Float, null: true
    field :amount_currency, String, null: true
    field :order_status, Integer, null: true
    field :user, UserType, null: true
    field :user_id, ID, null: true
    field :rrn, ID, null: false
    field :created_at, String, null: true
    field :updated_at, String, null: true
  end
end
