module Types
  class MutationType < Types::BaseObject
    field :create_order, mutation: Mutations::Orders::Create
  end
end
