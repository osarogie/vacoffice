module Types
  class QueryType < Types::BaseObject
    field :orders, OrderType.connection_type, null: false, description: "Orders", connection: true
    def orders
      Order.all
    end

    field :users, UserType.connection_type, null: false, description: "Users", connection: true
    def users
      User.all
    end
  end
end
