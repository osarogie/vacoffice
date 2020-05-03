module Types
  class QueryType < Types::BaseObject
    field :all_orders, OrderType.connection_type, null: false, description: "Orders", connection: true
    def all_orders
      Order.all
    end

    field :all_users, UserType.connection_type, null: false, description: "Users", connection: true
    def all_users
      User.all
    end
  end
end
