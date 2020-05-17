module Types
  class MutationType < Types::BaseObject
    field :make_order, mutation: Mutations::Orders::MakeOrder
  end
end

