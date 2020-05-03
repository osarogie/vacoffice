module Mutations
  class Orders::Create < BaseMutation
    field :status, Boolean, null: false
    field :message, String, null: true
    field :order, Types::OrderType, null: false

    argument :name, String, required: true
    argument :phone_number, String, required: true
    argument :pickup_address, String, required: true
    argument :delivery_address, String, required: true
    argument :payment_option, Integer, required: false
    argument :amount, Integer, required: true

    def resolve(**input)
      message = nil
      status = false
      order = Order.create(**input)

      { order: order, status: status, message: message }
    end
  end
end
