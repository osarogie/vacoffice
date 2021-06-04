module Mutations
  module Orders
    class MakeOrder < BaseMutation
      graphql_name "MakeOrder"

      field :status, Boolean, null: false
      field :message, String, null: true
      field :order, Types::OrderType, null: false

      argument :sender_name, String, required: true
      argument :sender_phone, String, required: true
      # argument :recipient_name, String, required: true
      # argument :recipient_phone, String, required: true
      argument :pickup_address, String, required: true
      argument :delivery_packages, [Types::DeliveryPackageInputType], required: true
      argument :payment_option, Integer, required: false
      # argument :amount, Integer, required: true

      def resolve(**input)
        message = nil
        delivery_packages = input[:delivery_packages].map { |pkg| DeliveryPackage.new(**pkg) }
        order = Order.create!(
          **input,
          delivery_packages: delivery_packages
        )

        { order: order, status: true, message: message }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record&.errors&.full_messages&.join(', ')}")
      end
    end
  end
end
