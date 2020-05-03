module Types
  class UserType < RelayObject
    field :id, ID, null: false
    field :full_name, String, null: true
    field :email, String, null: true
    field :phone_number, String, null: true
    field :orders, OrderType.connection_type, null: true, connection: true
    field :order_count, Integer, null: true

    def order_count
      object.orders.size
    end
  end
end