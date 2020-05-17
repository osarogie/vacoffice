module Mutations
  class Orders::MakeOrder < BaseMutation
    graphql_name "MakeOrder"

    field :status, Boolean, null: false
    field :message, String, null: true
    field :order, Types::OrderType, null: false

    argument :name, String, required: true
    argument :sender_name, String, required: true
    argument :sender_phone, String, required: true
    argument :recipient_name, String, required: true
    argument :recipient_phone, String, required: true
    argument :pickup_address, String, required: true
    argument :delivery_address, String, required: true
    argument :payment_option, Integer, required: false
    argument :amount, Integer, required: true

    def resolve(**input)
      message = nil
      order = Order.create!(**input)

      { order: order, status: true, message: message }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
