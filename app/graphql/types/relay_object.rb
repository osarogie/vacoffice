module Types
  class RelayObject < BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id
    field :_id, ID, method: :id, null: false
  end
end
