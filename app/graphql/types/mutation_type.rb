module Types
  class MutationType < Types::BaseObject
    field :add_order, mutation: Mutations::Orders::Create
  end
end
