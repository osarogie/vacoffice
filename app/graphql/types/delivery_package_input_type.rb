module Types
  class DeliveryPackageInputType < Types::BaseInputObject
    graphql_name "DeliveryPackageInputType"
    description "Delivery package input"

    argument :name, String, required: true
    argument :drop_off_address, String, required: true
    argument :recipient_name, String, required: true
    argument :recipient_phone, String, required: true
  end
end
