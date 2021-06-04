module Types
  class RelayObject < BaseObject
    implements GraphQL::Types::Relay::Node
    global_id_field :id
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField
    field :_id, ID, method: :id, null: false
  end
end
